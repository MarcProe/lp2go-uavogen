#! /usr/bin/env bash

#change the hash sfghghjdtzufhjhkfgjdf

rm -rf $2

git clone $1
cd $2
git checkout $3

export COMMIT=`git describe`


cd ..

rm -rf lp2go-uavo

git clone https://${GH_REF}
cd lp2go-uavo
git checkout master

python ../$2/make/scripts/version-info.py --uavodir=../$2/shared/uavobjectdefinition/ --outfile=.bashhash.sh --template=.bashinfo.TEMPLATE
. .bashhash.sh
rm .bashhash.sh

export FOLDER=${3//\//-}-$COMMIT-${UAVO_HASH:0:8}
export ZIP=$FOLDER.zip


rm -rf xml/$FOLDER
mkdir -p xml/$FOLDER
mkdir -p zip

cp ../$2/shared/uavobjectdefinition/*.xml xml/$FOLDER
cd xml/$FOLDER
zip $ZIP *.xml > /dev/null 2>&1

cd ../..
mv xml/$FOLDER/$ZIP zip

git config --global user.email "marcus@proest.net"
git config --global user.name "Marc"

git add --all
git commit -m "$3 ${COMMIT} ${UAVO_HASH:0:8}"

git push --quiet "https://${GH_TOKEN}@${GH_REF}" master > /dev/null 2>&1

cd ..
