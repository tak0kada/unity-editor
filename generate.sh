#!/bin/bash
set -euo pipefail

img_tag=$(podman image ls | \
          grep docker.io/unityci/editor | \
          awk '{print $2}' | \
          peco --prompt "Choose the docker image tag you prefer." 2>/dev/null)
if [ -z $img_tag ]; then
    echo -e "error: image tag is blank."
    exit 1
fi

export IMG_NAME=docker.io/unityci/editor:${img_tag}

envsubst '${IMG_NAME}' < Makefile.template > Makefile
envsubst '${IMG_NAME}' < Dockerfile.template > Dockerfile

set +euo pipefail
