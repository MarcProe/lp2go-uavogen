#!/usr/bin/env bash

git clone https://bitbucket.org/librepilot/librepilot.git
cd librepilot
git checkout next

export COMMIT=`git describe`
#make uavobjects

mkdir makeobjects


zip -j -5 makeobjects/next-${COMMIT}.zip shared/uavobjectdefinition/*.xml

cd makeobjects

git init
git config --global user.email "marcus@proest.net"
git config --global user.name "Marc"

git add next-${COMMIT}.zip
git commit -m "${COMMIT}"

git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master


cd ..
