#!/bin/bash

mkdir -p ${ROSI_CATKIN_WS}/src

(
    cd ${ROSI_CATKIN_WS}

    source "/opt/ros/melodic/setup.bash"

    catkin_make
    catkin init
    catkin clean --yes

    source devel/setup.bash

    catkin build

    (       
        cd src

        git clone "https://github.com/filRocha/sim_rosi"
        git clone --recursive https://github.com/CoppeliaRobotics/simExtROSInterface.git sim_ros_interface
        git clone https://github.com/ITVRoC/coppeliasim_plugin_velodyne.git

        (
            cd sim_ros_interface

            git checkout melodic
            echo -e "sim_rosi/HokuyoReading\\nsim_rosi/ManipulatorJoints\\nsim_rosi/RosiMovement\\nsim_rosi/RosiMovementArray" \
                 >> meta/messages.txt
            
            cp ${ROSI_INSTALL_ROOT}/setup/files/package.xml package.xml
            cp ${ROSI_INSTALL_ROOT}/setup/files/CMakeLists.txt CMakeLists.txt
        )
    )

    catkin build
)