//go:build (!windows || !with_naive_outbound || !with_purego) && (!android || !cgo || !with_naive_outbound || with_purego) && (!darwin || !cgo || !with_naive_outbound || with_purego)

package main

import "errors"

func prepareNaive() error {
	return errors.New("Naive is not supported by this core build")
}
