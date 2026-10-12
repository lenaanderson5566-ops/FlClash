//go:build !windows || !with_naive_outbound || !with_purego

package main

import "errors"

func prepareNaive() error {
	return errors.New("Naive is not supported by this core build")
}
