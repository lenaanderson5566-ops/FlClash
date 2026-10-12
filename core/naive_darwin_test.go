//go:build darwin && cgo && with_naive_outbound && !with_purego

package main

import "testing"

func requireNaiveTestRuntime(t *testing.T) { t.Helper() }
