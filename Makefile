.DEFAULT_GOAL := help

.PHONY: help
help:
		@grep -E '^[a-zA-Z0-9_-]+:.*?# .*$$' makefile | awk 'BEGIN {FS = ":[^#]*? #| #"}; {printf "%-57s%s\n", $$1 $$3, $$2}'

.PHONY: doctor
doctor: # $ fvm flutter doctor -v
		fvm flutter doctor -v

.PHONY: clean-and-get
clean-and-get: # $ fvm flutter clean -> $ fvm flutter pub get
		fvm flutter clean
		fvm flutter pub get

.PHONY: build-runner
build-runner: # $ fvm flutter pub run build_runner build --delete-conflicting-outputs
		fvm flutter pub run build_runner build --delete-conflicting-outputs