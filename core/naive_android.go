//go:build android && cgo && with_naive_outbound && !with_purego

package main

// Android Cronet is statically linked into the APK's signed native library.
func prepareNaive() error { return nil }
