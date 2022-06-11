#!/bin/bash

# Dependências de sistema
apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libgl-dev libgtk2.0-dev qt5-default

# Atualização do libPlugin do CoppeliaSim para a compilação do sim_ros_interface
cd ${COPPELIASIM_ROOT_DIR}/programming
rm -rf ./libPlugin
git clone "https://github.com/PatFireDragon/libPlugin"

# Patch que remove um cheque de versão que impede a compilação
cp ${ROSI_INSTALL_ROOT}/config/Plugin.h ${COPPELIASIM_ROOT_DIR}/programming/libPlugin/simPlusPlus/Plugin.h
