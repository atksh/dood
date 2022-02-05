#!/bin/bash

if [ $# != 3 ]; then
    echo "pass {organization/username} {repo} {branch}"
    exit 1
fi

name=$1/$2@$3
name_=$1_$2_$3
echo $name
docker run -d --rm \
  --mount type=volume,src=reviewer_volume,dst=/var/lib/docker \
  -v $HOME/.aws:/root/.aws:ro \
  --name $name_ --privileged \
  reviewer

docker exec -it $name_ \
  my_entrypoint.sh $1 $2 $3

docker stop $name_ >> /dev/null
