﻿#!/usr/bin/env bash

git clone https://bitbucket.org/librepilot/librepilot.git
cd librepilot
git checkout next

make uavobjects

mkdir makeobjects
cd makeobjects
zip -j -5 next-`git describe`.zip ../shared/uavobjectdefinition/*.xml
#../build/uavobjgenerator/uavobjgenerator -java -v ../shared/uavobjectdefinition ..
ls -al
cd ..
