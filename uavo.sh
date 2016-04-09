#!/usr/bin/env bash

git clone https://bitbucket.org/librepilot/librepilot.git
cd librepilot
git checkout next

#make uavobjects

mkdir makeobjects
cd makeobjects
zip -j -5 next-`git describe`.zip ../shared/uavobjectdefinition/*.xml

curl -X POST \--header "Content-Type: application/zip" \--data-binary @next-`git describe`.zip \https://api.github.com/gists

#curl --verbose --header "Content-Type: application/zip" --data-binary @C:\Junk\test.zip "http://client.xyz.com/submit?username=test@test.com&password=testpassword&job=test"

#../build/uavobjgenerator/uavobjgenerator -java -v ../shared/uavobjectdefinition ..
ls -al
cd ..
