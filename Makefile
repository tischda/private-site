# ---------------------------------------------------------------------------
# Makefile for private-site
# 
# Escape '#' and '[' characters with '\', and '$' characters with '$$'
# ---------------------------------------------------------------------------

PROJECT_NAME=$(shell basename $$(pwd))
PROJECT_DIR=$(notdir $(shell pwd))

VERSION=$(shell git describe --tags --always --dirty 2>/dev/null || echo "1.0.0-dev")
BUILD_DATE=$(shell date -u "+%Y-%m-%dT%H:%M:%SZ")
GIT_COMMIT=$(shell git rev-parse --short HEAD 2>/dev/null || echo "unknown")

# Extract version components for goversioninfo
XYZ_VERSION=$(shell echo $(VERSION) | sed -E 's/^v([0-9]+\.[0-9]+\.[0-9]+).*/\1/')
VER_MAJOR = $(shell echo $(XYZ_VERSION) | cut -d. -f1)
VER_MINOR = $(shell echo $(XYZ_VERSION) | cut -d. -f2)
VER_PATCH = $(shell echo $(XYZ_VERSION) | cut -d. -f3)
VER_BUILD = 0  # Set default build number if needed

MAKEFLAGS += --no-print-directory

all: clean dist-local

## dist: build the distribution (for the web)
dist:
	@cmd /c bin\dist.cmd

## dist-local: build a local distribution (local files, no web server)
dist-local:
	@cmd /c bin\dist-local.cmd

## start: start the web server
start: 
	@cmd /c bin\web-start.cmd

## stop: stop the web server
stop:
	@cmd /c bin\web-stop.cmd

## reload: reload the web server (for development)
reload:
	@cmd /c bin\web-reload.cmd

## watch: watch for changes and rebuild
watch: dist-local
	@start watchexec.exe --postpone --timings \""bin\dist-local.cmd"\" &

## clean: remove build output
clean:
	rm -rf dist

## version: show version info
version:
	@echo "$(PROJECT_NAME) $(VERSION), built on $(BUILD_DATE) (commit: $(GIT_COMMIT))"
	@echo
	@echo "CHANGELOG:"
	@sed '1,/\#\# \[${VERSION}/d;/^\#\# /Q' CHANGELOG.md

## help: display this help
help: Makefile
	@echo
	@echo " Choose a command run in "$(PROJECT_NAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

.PHONY: start stop reload watch clean
