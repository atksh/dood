#!/bin/bash

if [ $# -ne 3 ]; then
  echo "指定された引数は$#個です。" 1>&2
  echo "実行するには3個の引数(organization, repo, branch)が必要です。" 1>&2
  exit 1
fi

name=$1/$2@$3
echo $name
docker run --rm -it -v $SSH_AUTH_SOCK:/tmp/ssh-agent.sock -v $HOME/.aws:/root/.aws:ro --name name --privileged reviewer $1 $2 $3
