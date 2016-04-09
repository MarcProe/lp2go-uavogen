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

git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master > /dev/null 2>&1

#curl -X POST \--verbose \--header "Content-Type: application/zip" \--data-binary @next-`git describe`.zip \https://api.github.com/gists

#curl --verbose --header "Content-Type: application/zip" --data-binary @C:\Junk\test.zip "http://client.xyz.com/submit?username=test@test.com&password=testpassword&job=test"

#../build/uavobjgenerator/uavobjgenerator -java -v ../shared/uavobjectdefinition ..
ls -al
cd ..
