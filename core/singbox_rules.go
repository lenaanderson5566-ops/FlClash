package main

import (
	"crypto/sha256"
	"embed"
	"fmt"
	"os"
	"path/filepath"
	"strings"
	"sync"

	"github.com/sagernet/sing-box/option"
)

//go:embed rulesets/*.srs
var bundledSingboxRules embed.FS

var ruleInstallMu sync.Mutex

func configureSingboxRules(options *option.Options, home string) error {
	if options.Route == nil {
		return nil
	}
	for i := range options.Route.RuleSet {
		set := &options.Route.RuleSet[i]
		if set.Type != "remote" {
			continue
		}
		if home == "" {
			return fmt.Errorf("rule-set cache requires an initialized home directory")
		}
		if strings.HasPrefix(set.RemoteOptions.InitialPath, "fastai-bundled:") {
			name := strings.TrimPrefix(set.RemoteOptions.InitialPath, "fastai-bundled:")
			if name != "geoip-cn.srs" && name != "geosite-cn.srs" {
				return fmt.Errorf("unknown bundled rule-set %q", name)
			}
			path, err := installSingboxRule(home, name)
			if err != nil {
				return err
			}
			set.RemoteOptions.InitialPath = path
		}
		cacheDir := filepath.Join(home, "sing-box")
		if err := os.MkdirAll(cacheDir, 0700); err != nil {
			return err
		}
		options.Experimental.CacheFile = &option.CacheFileOptions{
			Enabled: true, Path: filepath.Join(cacheDir, "rules.db"),
		}
	}
	return nil
}

func installSingboxRule(home, name string) (string, error) {
	data, err := bundledSingboxRules.ReadFile("rulesets/" + name)
	if err != nil {
		return "", err
	}
	digest := sha256.Sum256(data)
	directory := filepath.Join(home, "sing-box", "rules", fmt.Sprintf("%x", digest[:8]))
	path := filepath.Join(directory, name)
	ruleInstallMu.Lock()
	defer ruleInstallMu.Unlock()
	if current, err := os.ReadFile(path); err == nil && sha256.Sum256(current) == digest {
		return path, nil
	}
	if err := os.MkdirAll(directory, 0700); err != nil {
		return "", err
	}
	file, err := os.CreateTemp(directory, ".rule-*")
	if err != nil {
		return "", err
	}
	defer os.Remove(file.Name())
	_, err = file.Write(data)
	closeErr := file.Close()
	if err != nil {
		return "", err
	}
	if closeErr != nil {
		return "", closeErr
	}
	if err := os.Rename(file.Name(), path); err != nil {
		return "", err
	}
	return path, nil
}
