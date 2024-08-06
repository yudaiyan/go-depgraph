.PHONY: all
all: build

.PHONY: build
build: 
	# 编译
	go mod tidy
	go get -u all
	GOEXPERIMENT=rangefunc go build -v ./...
	GOOS=windows GOARCH=amd64 GOEXPERIMENT=rangefunc go build -v ./...
	GOEXPERIMENT=rangefunc godepgraph -s github.com/yudaiyan/go-depgraph  > godepgraph.dot