//go:build windows && with_naive_outbound && with_purego

package main

import (
	"context"
	"crypto/rand"
	"crypto/rsa"
	"crypto/x509"
	"crypto/x509/pkix"
	"encoding/json"
	"encoding/pem"
	"io"
	"math/big"
	"net"
	"net/http"
	"net/http/httptest"
	"os"
	"os/exec"
	"path/filepath"
	"testing"
	"time"

	M "github.com/sagernet/sing/common/metadata"
)

func TestNaiveBundledRuntime(t *testing.T) {
	if cronetSHA256 == "" {
		t.Skip("requires packaged Cronet and embedded hash")
	}
	if err := prepareNaive(); err != nil {
		t.Fatal(err)
	}
	key, err := rsa.GenerateKey(rand.Reader, 2048)
	if err != nil {
		t.Fatal(err)
	}
	certificate := &x509.Certificate{
		SerialNumber: big.NewInt(1), Subject: pkix.Name{CommonName: "localhost"},
		DNSNames: []string{"localhost"}, IPAddresses: []net.IP{net.ParseIP("127.0.0.1")},
		NotBefore: time.Now().Add(-time.Hour), NotAfter: time.Now().Add(time.Hour),
		KeyUsage:    x509.KeyUsageDigitalSignature | x509.KeyUsageKeyEncipherment,
		ExtKeyUsage: []x509.ExtKeyUsage{x509.ExtKeyUsageServerAuth},
	}
	der, err := x509.CreateCertificate(rand.Reader, certificate, certificate, &key.PublicKey, key)
	if err != nil {
		t.Fatal(err)
	}
	cert := string(pem.EncodeToMemory(&pem.Block{Type: "CERTIFICATE", Bytes: der}))
	privateKey := string(pem.EncodeToMemory(&pem.Block{Type: "RSA PRIVATE KEY", Bytes: x509.MarshalPKCS1PrivateKey(key)}))
	listener, err := net.Listen("tcp", "127.0.0.1:0")
	if err != nil {
		t.Fatal(err)
	}
	port := listener.Addr().(*net.TCPAddr).Port
	listener.Close()
	serverConfig, _ := json.Marshal(map[string]any{
		"inbounds": []any{map[string]any{
			"type": "naive", "listen": "127.0.0.1", "listen_port": port, "network": "tcp",
			"users": []any{map[string]string{"username": "test", "password": "test"}},
			"tls":   map[string]any{"enabled": true, "certificate": []string{cert}, "key": []string{privateKey}},
		}},
		"outbounds": []any{map[string]string{"type": "direct", "tag": "DIRECT"}},
	})
	server, _, cancelServer, err := newSingbox(serverConfig, true)
	if err != nil {
		t.Fatal(err)
	}
	defer cancelServer()
	defer server.Close()
	if err = server.Start(); err != nil {
		t.Fatal(err)
	}
	clientConfig, _ := json.Marshal(map[string]any{
		"outbounds": []any{map[string]any{
			"type": "naive", "tag": "NAIVE", "server": "127.0.0.1", "server_port": port,
			"username": "test", "password": "test",
			"tls": map[string]any{"enabled": true, "server_name": "localhost", "certificate": []string{cert}},
		}},
	})
	destination := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) { w.WriteHeader(http.StatusNoContent) }))
	defer destination.Close()
	for i := 0; i < 3; i++ {
		client, _, cancelClient, err := newSingbox(clientConfig, false)
		if err != nil {
			t.Fatal(err)
		}
		if err = client.Start(); err != nil {
			cancelClient()
			client.Close()
			t.Fatal(err)
		}
		outbound, _ := client.Outbound().Outbound("NAIVE")
		transport := &http.Transport{DialContext: func(ctx context.Context, network, address string) (net.Conn, error) {
			return outbound.DialContext(ctx, network, M.ParseSocksaddr(address))
		}}
		response, requestErr := (&http.Client{Transport: transport, Timeout: 5 * time.Second}).Get(destination.URL)
		if response != nil {
			response.Body.Close()
		}
		transport.CloseIdleConnections()
		cancelClient()
		client.Close()
		if requestErr != nil {
			t.Fatal(requestErr)
		}
		if response.StatusCode != http.StatusNoContent {
			t.Fatalf("unexpected response: %d", response.StatusCode)
		}
	}
}

func TestNaiveRejectsInvalidDLL(t *testing.T) {
	if cronetSHA256 == "" {
		t.Skip("requires embedded Cronet hash")
	}
	if os.Getenv("FASTAI_TEST_INVALID_CRONET") == "1" {
		if err := prepareNaive(); err == nil {
			t.Fatal("invalid DLL accepted")
		}
		return
	}
	executable, err := os.Executable()
	if err != nil {
		t.Fatal(err)
	}
	for _, present := range []bool{false, true} {
		directory := t.TempDir()
		source, err := os.Open(executable)
		if err != nil {
			t.Fatal(err)
		}
		target := filepath.Join(directory, "core.test.exe")
		output, err := os.Create(target)
		if err != nil {
			source.Close()
			t.Fatal(err)
		}
		_, err = io.Copy(output, source)
		source.Close()
		output.Close()
		if err != nil {
			t.Fatal(err)
		}
		if present {
			if err = os.WriteFile(filepath.Join(directory, "libcronet.dll"), []byte("invalid"), 0600); err != nil {
				t.Fatal(err)
			}
		}
		command := exec.Command(target, "-test.run=^TestNaiveRejectsInvalidDLL$", "-test.timeout=10s")
		command.Env = append(os.Environ(), "FASTAI_TEST_INVALID_CRONET=1")
		if output, err := command.CombinedOutput(); err != nil {
			t.Fatalf("invalid DLL test failed: %v: %s", err, output)
		}
	}
}
