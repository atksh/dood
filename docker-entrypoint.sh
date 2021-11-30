#!/bin/bash
service docker start
git clone git@github.com:$1/$2.git
cd $2 && git checkout $3
/bin/bash
