#! /usr/bin/env bash

#change the hash mreujmrjndfuzjnzr

rm -rf $2

git clone $1
cd $2
git checkout $3

cd ..

rm -rf lp2go-uavo

git clone https://${GH_REF}
cd lp2go-uavo
git checkout master

python ../$2/make/scripts/version-info.py --uavodir=../$2/shared/uavobjectdefinition/ --outfile=.bashinfo.sh --template=.bashinfo.TEMPLATE
. .bashinfo.sh
cat .bashinfo.sh
rm .bashinfo.sh

export REPOSRC=${3//\//-}
echo $REPOSRC
export FOLDER=$REPOSRC-$TAG_OR_BRANCH-$HASH8-$UAVO_HASH8
export ZIP=$FOLDER.zip


rm -rf xml/$FOLDER
mkdir -p xml/$FOLDER
mkdir -p zip

zip -d zip/$ZIP *.xml 

cp ../$2/shared/uavobjectdefinition/*.xml xml/$FOLDER
cd xml/$FOLDER

zip $ZIP *.xml 

cd ../..
mv xml/$FOLDER/$ZIP zip

git config --global user.email "marcus@proest.net"
git config --global user.name "Marc"

git add --all
git commit -m "$FOLDER"

git push --quiet "https://${GH_TOKEN}@${GH_REF}" master > /dev/null 2>&1

cd ..
