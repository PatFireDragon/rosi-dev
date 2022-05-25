#!/bin/bash

echo "source /opt/ros/melodic/setup.bash" > /root/.bashrc
echo "source ${ROSI_CATKIN_WS}/devel/setup.bash" > /root/.bashrc
echo "alias coppelia_sim=${ROSI_COPPELIA_SIM_DIR}/coppeliaSim.sh" > /root/.bashrc