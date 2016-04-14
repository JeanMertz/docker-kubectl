# kubectl container

`scratch` container with the kubectl binary.

```shell
USAGE:

  make download - download `kubectl` version defined in $KUBECTL_VERSION.
  make build    - build image, tag with git-rev.
  make push     - push container to Docker registry.
  make clean    - clean local artifacts.
```

Optionally set `KUBECTL_VERSION` to specify the kubectl version to build. Set
`VERSION` to specify the container tag to use (defaults to current git ref).
