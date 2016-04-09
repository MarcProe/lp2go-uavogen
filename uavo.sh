#!/usr/bin/env bash

git clone $1
cd $2
git checkout $3

export COMMIT=`git describe`

cd ..

git clone https://${GH_REF}
cd lp2go-uavo

rm next-${COMMIT}.zip 
zip -j -5 next-${COMMIT}.zip ../$2/shared/uavobjectdefinition/*.xml

git config --global user.email "marcus@proest.net"
git config --global user.name "Marc"

git add next-${COMMIT}.zip
git commit -m "${COMMIT}"

git push --quiet "https://${GH_TOKEN}@${GH_REF}" master > /dev/null 2>&1

cd ..
