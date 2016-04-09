#!/usr/bin/env bash

git clone https://bitbucket.org/librepilot/librepilot.git
cd librepilot
git checkout next

#make uavobjects

mkdir makeobjects

zip -j -5 makeobjects/next-`git describe`.zip ../shared/uavobjectdefinition/*.xml

cd makeobjects

git init
git add next-`git describe`.zip
git commit -m "Yo."

#curl -X POST \--verbose \--header "Content-Type: application/zip" \--data-binary @next-`git describe`.zip \https://api.github.com/gists

#curl --verbose --header "Content-Type: application/zip" --data-binary @C:\Junk\test.zip "http://client.xyz.com/submit?username=test@test.com&password=testpassword&job=test"

#../build/uavobjgenerator/uavobjgenerator -java -v ../shared/uavobjectdefinition ..
ls -al
cd ..
