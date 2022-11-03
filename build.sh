#!/bin/sh

while :
do
	mkdir build
    cd build
    mkdir linux
    cd linux
    rm * -r
    cd ../../extlibs/sciter-js-sdk/bin/linux/
    ./packfolder /home/maiku/Documents/Projects/LoL-sciter/resources/ /home/maiku/Documents/Projects/LoL-sciter/src/resources.cpp
    cd ../../../../build/linux
    cmake ../../
    cmake --build .
    cp ../../extlibs/sciter-js-sdk/bin/linux/x64/libsciter.so libsciter.so
    ./LoL-sciter
    cd ../../
done
