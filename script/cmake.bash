#!/bin/bash

# Dependências de sistema
apt-get -y install libssl-dev

# Instalação from source do CMake para evitar erros de versão mínima na compilação do sim_ros_interface
cd ${ROSI_CMAKE_ROOT_DIR}

./bootstrap
make -j16 -l16
make install
