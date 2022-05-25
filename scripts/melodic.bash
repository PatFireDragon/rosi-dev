#!/bin/bash

sh -c 'echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s "https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc" | apt-key add -
apt-get update
DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install ros-${ROSI_DISTRO}-desktop
apt-get -y install python-rosdep python-rosinstall python-rosinstall-generator python-wstool


### Instalação de pacotes auxiliares
apt-get -y install python-catkin-tools ros-${ROSI_DISTRO}-{,brics-actuator,tf2,joy,joint-state-publisher}

python3 -m pip install xmlschema
