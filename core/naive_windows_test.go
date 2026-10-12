//go:build windows && with_naive_outbound && with_purego

package main

import (
	"io"
	"os"
	"os/exec"
	"path/filepath"
	"testing"
)

func requireNaiveTestRuntime(t *testing.T) {
	if cronetSHA256 == "" {
		t.Skip("requires packaged Cronet and embedded hash")
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
