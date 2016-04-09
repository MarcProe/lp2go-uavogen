#!/usr/bin/env bash

git clone https://bitbucket.org/librepilot/librepilot.git
cd librepilot
git checkout next

export COMMIT=`git describe`

cd ..

git clone https://${GH_REF}
cd lp2go-uavo

rm next-${COMMIT}.zip 
zip -j -5 next-${COMMIT}.zip ../shared/uavobjectdefinition/*.xml

#git init
git config --global user.email "marcus@proest.net"
git config --global user.name "Marc"

git add next-${COMMIT}.zip
git commit -m "${COMMIT}"

git push --quiet "https://${GH_TOKEN}@${GH_REF}" master > /dev/null 2>&1


cd ..
