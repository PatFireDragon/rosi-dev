FROM ubuntu:bionic


ENV ROSI_INSTALL_ROOT="/opt/rosi"
ENV ROS_CATKIN_WS="/root/catkin_ws"
ENV ROSI_DISTRO="melodic"

ENV ROSI_CMAKE_FILENAME="cmake-3.18.6"
ENV ROSI_CMAKE_ROOT_DIR="${ROSI_INSTALL_ROOT}/${ROSI_CMAKE_FILENAME}"

ENV COPPELIASIM_FILENAME="CoppeliaSim_Edu_V4_1_0_Ubuntu18_04"
ENV COPPELIASIM_ROOT_DIR="${ROSI_INSTALL_ROOT}/${COPPELIASIM_FILENAME}"


WORKDIR ${ROSI_INSTALL_ROOT}


ADD file/${COPPELIASIM_FILENAME} ${COPPELIASIM_ROOT_DIR}
ADD file/${ROSI_CMAKE_FILENAME} ${ROSI_CMAKE_ROOT_DIR}
ADD config config
ADD script script


RUN bash script/base.bash
RUN bash script/cmake.bash
RUN bash script/melodic.bash
RUN bash script/coppelia.bash
RUN bash script/shell.bash
RUN bash script/catkin.bash


WORKDIR ${ROS_CATKIN_WS}


ENTRYPOINT [ "/bin/bash" ]