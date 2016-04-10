#!/bin/bash

#change the hash sfghghjdtzufhjhkfgjdf

rm -rf $2

git clone $1
cd $2
git checkout $3

export COMMIT=`git describe`
export ZIP=${3//\//-}-$COMMIT.zip

cd ..

rm -rf lp2go-uavo

git clone https://${GH_REF}
cd lp2go-uavo
git checkout master

rm $ZIP

zip $ZIP ../$2/shared/uavobjectdefinition/*.xml

git config --global user.email "marcus@proest.net"
git config --global user.name "Marc"

git add $ZIP
git commit -m "$3 ${COMMIT}"

git push --quiet "https://${GH_TOKEN}@${GH_REF}" master > /dev/null 2>&1

cd ..
