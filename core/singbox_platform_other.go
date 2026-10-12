//go:build !android || !cgo

package main

import (
	"context"
	"github.com/sagernet/sing-box/option"
)

func singboxPlatformContext(ctx context.Context) context.Context           { return ctx }
func configureSingboxPlatform(options *option.Options, running bool) error { return nil }
