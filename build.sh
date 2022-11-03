#!/bin/sh
mkdir build
cd build
mkdir linux
cd linux
rm * -r
./extlibs/sciter-js-sdk/bin/linux/packfolder /home/maiku/Documents/Projects/LoL-sciter/resources/ /home/maiku/Documents/Projects/LoL-sciter/src/resources.cpp
cmake ../../
cmake --build .
cp ../../extlibs/sciter-js-sdk/bin/linux/x64/libsciter.so libsciter.so
