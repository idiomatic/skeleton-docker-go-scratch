# About

[skeleton-docker-go-scratch] is a baseline [Go](https://golang.org) project that:

1. compiles a trivial webserver in a "throw-away" Docker build container
2. builds a minimal Docker image with just that webserver

This strategy omits the source from the runtime image.

# Usage

## containerized app build

Optional.  Builds a static binary.

    make skeleton-docker-go-scratch

## host app build

Optional.  Build the webserver using the host-installed Go toolchain.

    make build_via_installed_go

## image build

Build a Docker image.

    make build

## run

Launch the container.

    make run

Exit with Ctrl-C (or similar).

## clean

Remove all byproducts.

    make clean
