# Podman (docker) image for Unity Editor
## Usage
```sh
$ podman pull docker.io/unityci/editor:2021.1.16f1-windows-mono-0
$ bash generate.sh
$ make install  # build derived image
$ make up  # run container
$ make unity  # execute unity editor on the running container
$ make down  # turn down container
$ make clean  # remove image
```
Tip: Go to [https://hub.docker.com/r/unityci/editor/tags](https://hub.docker.com/r/unityci/editor/tags) for other images.

# Reference
* [https://github.com/game-ci/docker](https://github.com/game-ci/docker)
  * Base image for this container
* [https://zenn.dev/nekomimi_daimao/articles/5642fc80a02791](https://zenn.dev/nekomimi_daimao/articles/5642fc80a02791)
  * Borrow command to download alf file.
