# USAGE:
#
#   make download - download `kubectl` version defined in $KUBECTL_VERSION.
#   make build    - build image, tag with git-rev.
#   make push     - push container to Docker registry.
#   make clean    - clean local artifacts.
#
KUBECTL_VERSION := 1.2.2
VERSION = $(shell git rev-parse --short HEAD)

all: download build push

download:
	curl -O https://storage.googleapis.com/kubernetes-release/release/v$(KUBECTL_VERSION)/bin/linux/amd64/kubectl

build:
	chmod +x kubectl
	docker build -t jeanmertz/kubectl:$(VERSION) .

push:
	docker push jeanmertz/kubectl:$(VERSION)

clean:
	rm -f kubectl

.PHONY: build push clean
