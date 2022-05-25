FROM ubuntu:bionic
ENV ROSI_INSTALL_ROOT="/opt/rosi"
ENV ROSI_CATKIN_WS="/root/catkin_ws"
ENV ROSI_COPPELIA_SIM_DIR="${ROSI_INSTALL_ROOT}/CoppeliaSim_Player_V4_3_0_Ubuntu18_04"
ENV ROSI_CMAKE_DIR="${ROSI_INSTALL_ROOT}/cmake-3.18.6"
ENV ROSI_DISTRO="melodic"

WORKDIR ${ROSI_INSTALL_ROOT}

ADD zips/CoppeliaSim_Player_V4_3_0_Ubuntu18_04.tar.xz .
ADD zips/cmake-3.18.6.tar.gz .
ADD configs configs
ADD scripts scripts

RUN bash scripts/base.bash
RUN bash scripts/cmake.bash
RUN bash scripts/melodic.bash
RUN bash scripts/catkin.bash
RUN bash scripts/coppelia.bash
#RUN bash scripts/vnc.bash (DEPRECADO: usar X window forwarding via ssh)
RUN bash scripts/shell.bash


ENTRYPOINT [ "/bin/bash" ]