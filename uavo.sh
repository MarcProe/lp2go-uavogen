#! /usr/bin/env bash

#change the hash jzdtzjhdszjhdztj

zip -h

rm -rf $2

git clone $1
cd $2
git checkout $3

cd ..

rm -rf lp2go-uavo

git clone https://${GH_REF}
cd lp2go-uavo
git checkout master

cd ../$2
python make/scripts/version-info.py --uavodir=shared/uavobjectdefinition/ --outfile=.bashinfo.sh --template=../lp2go-uavo/.bashinfo.TEMPLATE
. .bashinfo.sh
cat .bashinfo.sh
rm .bashinfo.sh
cd ../lp2go-uavo


export REPOSRC=${TAG_OR_BRANCH//\//-}
export FOLDER=$REPOSRC-$HASH8-$UAVO_HASH8
export ZIP=$FOLDER.zip


rm -rf xml/$FOLDER
mkdir -p xml/$FOLDER

cp ../$2/shared/uavobjectdefinition/*.xml xml/$FOLDER

zip -j -u zip/$ZIP xml/*.xml 

git config --global user.email "marcus@proest.net"
git config --global user.name "Marc"

git add --all
git commit -m "$FOLDER"

git push --quiet "https://${GH_TOKEN}@${GH_REF}" master > /dev/null 2>&1

cd ..
