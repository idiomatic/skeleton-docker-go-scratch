APP    = skeleton-docker-go-scratch
PORT   = 8338
DOCKER = /usr/local/bin/docker

all: build run

$(APP): $(DOCKER)
	$(DOCKER) run --rm -v "$$PWD":/go/src/$@ -w /go/src/$@ --env CGO_ENABLED=0 golang:latest go build -v -o $@

build_via_installed_go: go
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o $(APP)

build: $(DOCKER) $(APP)
	$(DOCKER) build -t $(APP) .

run: build $(DOCKER)
	$(DOCKER) run --rm --name $(APP) --publish=$(PORT):80 $(APP)

clean: $(DOCKER)
	-rm $(APP)
	-$(DOCKER) kill $(APP)
	-$(DOCKER) rmi $(APP)

$(DOCKER):
	[ `uname -s` = Darwin ] && brew install docker

.PHONY: all build run clean
