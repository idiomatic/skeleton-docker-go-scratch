APP=skeleton-docker-go-scratch
PORT=8338

all: build run

$(APP):
	docker run --rm -v "$$PWD":/go/src/$@ -w /go/src/$@ --env CGO_ENABLED=0 golang:latest go build -v -o $@

build_via_installed_go:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o $(APP)

build: $(APP)
	docker build -t $(APP) .

run:
	docker run --rm --name $(APP) --publish=$(PORT):80 $(APP)

clean:
	-rm $(APP)
	-docker kill $(APP)
	-docker rmi $(APP)
