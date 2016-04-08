#!/usr/bin/env bash

git clone https://bitbucket.org/librepilot/librepilot.git
cd librepilot
git checkout next
echo "¯\_(ツ)_/¯"
make all_sdk_install

echo "¯\_(ツ)_/¯"
make osg_install

echo "¯\_(ツ)_/¯"
make osgearth_install

echo "¯\_(ツ)_/¯"
make opfw_resource

echo "¯\_(ツ)_/¯"
make gcs 

echo "¯\_(ツ)_/¯"
make package 

echo "¯\_(ツ)_/¯"
make uavobjects

echo "¯\_(ツ)_/¯"

#make uavobjects
mkdir makeobjects
cd makeobjects
zip -j -5 next.zip ../shared/uavobjectdefinition/*.xml
#../build/uavobjgenerator/uavobjgenerator -java -v ../shared/uavobjectdefinition ..
#ls -al
cd ..
