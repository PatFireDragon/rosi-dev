#!/bin/bash

apt-get -y install libssl-dev

cd ${ROSI_CMAKE_DIR}

./bootstrap
make -j8
make install