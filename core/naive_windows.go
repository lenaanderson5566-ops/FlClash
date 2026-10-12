//go:build windows && with_naive_outbound && with_purego

package main

import (
	"crypto/sha256"
	"encoding/hex"
	"errors"
	"io"
	"os"
	"path/filepath"
	"sync"

	"github.com/sagernet/cronet-go"
	"golang.org/x/sys/windows"
)

var cronetSHA256 string
var naiveOnce sync.Once
var naiveError error
var cronetFile *os.File

func prepareNaive() error {
	naiveOnce.Do(func() { naiveError = loadBundledCronet() })
	return naiveError
}

func loadBundledCronet() error {
	if len(cronetSHA256) != 64 {
		return errors.New("Naive support requires a verified Cronet build")
	}
	executable, err := os.Executable()
	if err != nil {
		return err
	}
	path := filepath.Join(filepath.Dir(executable), "libcronet.dll")
	wide, err := windows.UTF16PtrFromString(path)
	if err != nil {
		return err
	}
	handle, err := windows.CreateFile(wide, windows.GENERIC_READ, windows.FILE_SHARE_READ, nil, windows.OPEN_EXISTING, windows.FILE_ATTRIBUTE_NORMAL, 0)
	if err != nil {
		return errors.New("Naive dependency libcronet.dll is missing or unavailable; reinstall FastAI")
	}
	file := os.NewFile(uintptr(handle), path)
	hash := sha256.New()
	_, err = io.Copy(hash, file)
	if err != nil || hex.EncodeToString(hash.Sum(nil)) != cronetSHA256 {
		file.Close()
		return errors.New("Naive dependency verification failed; reinstall FastAI")
	}
	if err = cronet.LoadLibrary(path); err != nil {
		file.Close()
		return errors.New("Naive dependency cannot be loaded; reinstall FastAI")
	}
	// Keep the verified DLL locked against replacement while the core can call it.
	cronetFile = file
	return nil
}
