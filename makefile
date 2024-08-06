.PHONY: all
all: build

.PHONY: build
build: 
	go mod tidy
	GOEXPERIMENT=rangefunc go build -v ./...
	GOOS=windows GOARCH=amd64 GOEXPERIMENT=rangefunc go build -v ./...
	GOEXPERIMENT=rangefunc godepgraph -s github.com/yudaiyan/go-depgraph  > godepgraph.dot