#!/bin/bash

apt-get -y install libssl-dev

cd ${ROSI_CMAKE_DIR}

./bootstrap
make -j16 -l16
make install