package main

import (
	"context"
	"maps"
	"sync"
	"time"
)

// Poll automatic selector changes only while the host watches.
const routePollInterval = time.Second

type routeTracker struct {
	mu               sync.Mutex
	epoch            uint64
	picksVersion     uint64
	picks            map[string]string
	providerVersions map[string]uint32
	ruleSets         map[string]any
	watched          bool
	watchSeq         uint64
	stopPoll         context.CancelFunc
}

var (
	currentRoute routeTracker

	publishRoute = func(state RouteState) {
		sendMessage(Message{Type: RouteChangedMessage, Data: state})
	}
)

func routeStateLocked() RouteState {
	picks := currentRoute.picks
	if picks == nil {
		picks = map[string]string{}
	}
	return RouteState{
		CoreEpoch:    currentRoute.epoch,
		PicksVersion: currentRoute.picksVersion,
		Picks:        maps.Clone(picks),
	}
}

func routeState() RouteState {
	currentRoute.mu.Lock()
	defer currentRoute.mu.Unlock()
	return routeStateLocked()
}

func routeStamp() (epoch, picksVersion uint64) {
	currentRoute.mu.Lock()
	defer currentRoute.mu.Unlock()
	return currentRoute.epoch, currentRoute.picksVersion
}

func readPicks() (map[string]string, map[string]uint32) {
	picks, _ := singboxPicks()
	return picks, map[string]uint32{}
}
func readRuleSets() map[string]any { return map[string]any{} }

// A provider that swapped its list is a structural change: the names may
// survive while the servers behind them do not. The caller holds selectMu.
func refreshRouteLocked(structural bool) {
	picks, versions := readPicks()
	ruleSets := readRuleSets()

	currentRoute.mu.Lock()
	if currentRoute.providerVersions != nil && !maps.Equal(versions, currentRoute.providerVersions) {
		structural = true
	}
	if currentRoute.ruleSets != nil && !maps.Equal(ruleSets, currentRoute.ruleSets) {
		structural = true
	}
	currentRoute.providerVersions = versions
	currentRoute.ruleSets = ruleSets
	if structural {
		currentRoute.epoch++
	}
	changed := structural
	if !maps.Equal(picks, currentRoute.picks) {
		currentRoute.picks = picks
		currentRoute.picksVersion++
		changed = true
	}
	state := routeStateLocked()
	watched := currentRoute.watched
	currentRoute.mu.Unlock()

	if changed && watched {
		publishRoute(state)
	}
}

func refreshRoute() {
	selectMu.Lock()
	defer selectMu.Unlock()
	refreshRouteLocked(false)
}

func bumpRouteEpoch() {
	selectMu.Lock()
	defer selectMu.Unlock()
	refreshRouteLocked(true)
}

func handleWatchRoute(watch bool, seq uint64) RouteState {
	refreshRoute()

	currentRoute.mu.Lock()
	defer currentRoute.mu.Unlock()
	if seq < currentRoute.watchSeq {
		return routeStateLocked()
	}
	currentRoute.watchSeq = seq
	currentRoute.watched = watch
	if watch && currentRoute.stopPoll == nil {
		ctx, cancel := context.WithCancel(context.Background())
		currentRoute.stopPoll = cancel
		go pollRoute(ctx)
	}
	if !watch {
		stopRoutePollLocked()
	}
	return routeStateLocked()
}

// The stop takes its own place in the call order: a watch dispatched before
// it, the newest one included, may still be waiting to run.
func stopRouteWatch() {
	currentRoute.mu.Lock()
	defer currentRoute.mu.Unlock()
	currentRoute.watchSeq = max(currentRoute.watchSeq, methodCallSeq.Add(1))
	currentRoute.watched = false
	stopRoutePollLocked()
}

func stopRoutePollLocked() {
	if currentRoute.stopPoll != nil {
		currentRoute.stopPoll()
		currentRoute.stopPoll = nil
	}
}

// With the listeners down the host pins every probe to DIRECT, so the picks
// do not matter until they come back.
func pollRoute(ctx context.Context) {
	ticker := time.NewTicker(routePollInterval)
	defer ticker.Stop()
	for {
		select {
		case <-ctx.Done():
			return
		case <-ticker.C:
			if isRunning.Load() {
				refreshRoute()
			}
		}
	}
}
