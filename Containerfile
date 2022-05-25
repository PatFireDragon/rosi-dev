FROM ubuntu:bionic
ENV ROSI_INSTALL_ROOT="/opt/rosi"
ENV ROSI_CATKIN_WS="/root/catkin_ws"
ENV ROSI_COPPELIA_SIM_DIR="${ROSI_INSTALL_ROOT}/CoppeliaSim_Player_V4_3_0_Ubuntu18_04"
ENV ROSI_CMAKE_DIR="${ROSI_INSTALL_ROOT}/cmake-3.18.6"
ENV ROSI_DISTRO="melodic"

WORKDIR ${ROSI_INSTALL_ROOT}

#ADD CoppeliaSim_Player_V4_3_0_Ubuntu18_04.tar.xz .
ADD cmake-3.18.6.tar.gz .
ADD setup setup

RUN bash setup/base.bash
RUN bash setup/cmake.bash
RUN bash setup/melodic.bash
RUN bash setup/catkin.bash
#RUN bash setup/coppelia.bash
RUN bash setup/vnc.bash
RUN bash setup/shell.bash


CMD ["vncserver -httpport 5902", "bash"]