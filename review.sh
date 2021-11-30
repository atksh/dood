#!/bin/bash

if [ $# != 3 ]; then
    echo "pass {organization/username} {repo} {branch}"
    exit 1
fi

name=$1/$2@$3
echo $name
docker run --rm -it \
  --mount type=volume,src=reviewer_volume,dst=/var/lib/docker \
  -v $HOME/.aws:/root/.aws:ro \
  --name name --privileged \
  reviewer $1 $2 $3
