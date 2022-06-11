#!/bin/bash

# Instruções para facilitar o workflow dentro do contâiner
echo "source /opt/ros/melodic/setup.bash" >> /root/.bashrc
echo "source ${ROS_CATKIN_WS}/devel/setup.bash" >> /root/.bashrc
echo "alias coppelia_sim=${COPPELIASIM_ROOT_DIR}/coppeliaSim.sh" >> /root/.bashrc
