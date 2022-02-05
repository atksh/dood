#!/bin/bash
git clone git@github.com:$1/$2.git
cd $2 && git checkout $3
ps1='\e[32m'$1/$2@$3'\e[35m:\e[34m\w \e[0m$ '
echo "export PS1='$ps1'" >> /root/.bashrc
eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa
/bin/bash
