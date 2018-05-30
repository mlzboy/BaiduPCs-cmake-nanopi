#! /bin/bash
export CC=/usr/bin/gcc
export LD_LIBRARY_PATH=/usr/lib/arm-linux-gnueabihf
sudo ldconfig
dir=build/
 
if [ ! -d  $dir ]; then
	mkdir -p $dir
fi

cd $dir
rm -rf *
#cmake -DCMAKE_TOOLCHAIN_FILE=../toolchain.cmake -DCMAKE_BUILD_TYPE=Debug ..
cmake -DCMAKE_BUILD_TYPE=Debug ..
make -j4
