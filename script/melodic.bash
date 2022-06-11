#!/bin/bash

# Inscrição no repo do ubuntu 18.04 do ROS
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s "https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc" | apt-key add -
apt-get update

# Instalação do ros-melodic-desktop-full
# As duas variáveis de ambiente são para evitarem interatividade na instalação do tzinfo
DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install ros-${ROSI_DISTRO}-desktop-full

# Instalação de pacotes auxiliares para o ROSI
apt-get -y install python-catkin-tools \
                   ros-${ROSI_DISTRO}-brics-actuator \
                   ros-${ROSI_DISTRO}-joy \
                   ros-${ROSI_DISTRO}-joint-state-publisher \
                   ros-${ROSI_DISTRO}-tf2-geometry-msgs \
                   ros-${ROSI_DISTRO}-tf2-sensor-msgs