all: build test

init:
	go env -w GO111MODULE=auto
	go install github.com/prometheus/promu@latest
	go install github.com/AlekSi/gocoverutil@latest

build:
	go install -v
	promu build

test:
	go test -v -race
	gocoverutil -coverprofile=coverage.txt test -v
