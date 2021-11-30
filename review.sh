#!/bin/bash

if [ $# != 3 ]; then
    echo "pass {organization/username} {repo} {branch}"
    exit 1
fi

name=$1/$2@$3
docker run --rm -it -v $HOME/.aws:/root/.aws:ro --name name --privileged reviewer $1 $2 $3
