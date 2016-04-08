#!/usr/bin/env bash

git clone https://bitbucket.org/librepilot/librepilot.git
cd librepilot
git checkout next

make all_sdk_install

make uavobjects
mkdir makeobjects
cd makeobjects
zip -j -5 next.zip ../shared/uavobjectdefinition/*.xml
#../build/uavobjgenerator/uavobjgenerator -java -v ../shared/uavobjectdefinition ..
ls -al
cd ..
