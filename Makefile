# USAGE:
#
#   make download - download `kubectl` version defined in $KUBECTL_VERSION.
#   make build    - build image, tag with git-rev.
#   make push     - push container to Docker registry.
#   make clean    - clean local artifacts.
#
KUBECTL_VERSION := 1.3.5
VERSION = $(shell git rev-parse --short HEAD)

all: download build push

download:
	curl -O https://storage.googleapis.com/kubernetes-release/release/v$(KUBECTL_VERSION)/bin/linux/amd64/kubectl

build: download
	chmod +x kubectl
	docker build -t jeanmertz/kubectl:$(VERSION) .
	docker tag jeanmertz/kubectl:$(VERSION) jeanmertz/kubectl:latest

push:
	docker push jeanmertz/kubectl:$(VERSION)
	docker push jeanmertz/kubectl:latest

clean:
	rm -f kubectl

.PHONY: build push clean
