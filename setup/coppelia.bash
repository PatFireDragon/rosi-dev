#!/bin/bash

apt-get install libavcodec-dev libavformat-dev libswscale-dev

(
        cd ${ROSI_COPPELIA_SIM_DIR}/programming
        rm -rf ./libPlugin
        git clone https://github.com/CoppeliaRobotics/libPlugin

        cp ${ROSI_CATKIN_WS}/devel/lib/libsimExtROSInterface.so ${ROSI_COPPELIA_SIM_DIR}
        cp ${ROSI_CATKIN_WS}/devel/lib/libv_repExtRosVelodyne.so ${ROSI_COPPELIA_SIM_DIR}
)