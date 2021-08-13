#!/bin/bash
set -euo pipefail

IMG_TAG=$(podman image ls | \
          grep docker.io/unityci/editor | \
          awk '{print $2}' | \
          peco --prompt "Choose the docker image tag you prefer." 2>/dev/null)
if [ -z $IMG_TAG ]; then
    echo -e "error: image tag is blank."
    exit 1
fi

export IMG_NAME=docker.io/unityci/editor:${IMG_TAG}
export MY_IMG_TAG=unity-editor-${IMG_TAG}

envsubst '${IMG_NAME} ${MY_IMG_TAG}' < Makefile.template > Makefile
envsubst '${IMG_NAME} ${MY_IMG_TAG}' < Dockerfile.template > Dockerfile

set +euo pipefail
