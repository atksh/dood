#!/bin/bash
set -e
if [ $# != 1 ]; then
    echo "pass private key path"
    exit 1
fi

private_key_path=$1
docker volume create reviewer_volume
docker build -t reviewer --build-arg SSH_PRIVATE_KEY="$(cat $private_key_path)" .
cp review.sh ~/.local/bin/review.sh && chmod +x ~/.local/bin/review.sh

