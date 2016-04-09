#!/usr/bin/env bash

export ZIP=${3//\//-}

rm -rf $2

git clone $1
cd $2
git checkout $3

export COMMIT=`git describe`

cd ..

rm -rf lp2go-uavo

git clone https://${GH_REF}
cd lp2go-uavo

rm ${ZIP}_-${COMMIT}.zip 
echo "#"
echo ${ZIP}_${COMMIT}.zip
echo "#"
zip -h
echo "#"

zip -j -5 "${ZIP}_${COMMIT}.zip" ../$2/shared/uavobjectdefinition/*.xml

git config --global user.email "marcus@proest.net"
git config --global user.name "Marc"

git add "${ZIP}_${COMMIT}.zip"
git commit -m "${ZIP} ${COMMIT}"

git push --quiet "https://${GH_TOKEN}@${GH_REF}" master > /dev/null 2>&1

cd ..
