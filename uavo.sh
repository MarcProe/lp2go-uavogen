#!/bin/bash

#change the hash sfghghjdtzufhjhkfgjdf

rm -rf $2

git clone $1
cd $2
git checkout $3

export COMMIT=`git describe`
export ZIP=${3//\//-}-$COMMIT.zip
export FOLDER=${3//\//-}-$COMMIT

cd ..

rm -rf lp2go-uavo

git clone https://${GH_REF}
cd lp2go-uavo
git checkout master

mkdir -p $FOLDER
mkdir -p zip
mkdir -p xml

cp ../$2/shared/uavobjectdefinition/*.xml xml/$FOLDER
cd xml/$FOLDER
zip $ZIP *.xml > /dev/null 2>&1

cd ..
mv xml/$FOLDER/$ZIP zip

git config --global user.email "marcus@proest.net"
git config --global user.name "Marc"

git add .
git commit -m "$3 ${COMMIT}"

git push --quiet "https://${GH_TOKEN}@${GH_REF}" master > /dev/null 2>&1

cd ..
