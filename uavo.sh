#!/usr/bin/env bash

git clone https://bitbucket.org/librepilot/librepilot.git
cd librepilot
git checkout next

make uavobjects

mkdir makeobjects
cd makeobjects
zip -j -5 next-`git describe`.zip ../shared/uavobjectdefinition/*.xml

curl -X POST \--data-binary '{"files": {"next-`git describe`.zip": {"content": "Hello, SO"}}}' \https://api.github.com/gists

#../build/uavobjgenerator/uavobjgenerator -java -v ../shared/uavobjectdefinition ..
ls -al
cd ..
