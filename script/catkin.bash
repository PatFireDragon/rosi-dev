#!/bin/bash

# Criação de arquvios para o workspace
mkdir -p ${ROS_CATKIN_WS}/src ${ROS_CATKIN_WS}/devel ${ROS_CATKIN_WS}/build

(
    cd ${ROS_CATKIN_WS}

    source /opt/ros/melodic/setup.bash

    # Inicialização do catkin_ws
    # O passo de build vazio é necessário para a criação do devel/setup.bash
    catkin init
    catkin build

    source devel/setup.bash

    # Instalação de um pacote auxiliar para validar manifestos .xml
    python3 -m pip install xmlschema
    apt-get -y install xsltproc

    (       
        cd src

        # Clonagem dos pacotes necessários para o ROSI
        git clone "https://github.com/filRocha/sim_rosi"
        git clone --recursive "https://github.com/PatFireDragon/simExtROS" sim_ros_interface
        git clone "https://github.com/PatFireDragon/coppeliasim_plugin_velodyne"

        (
            # Configuração do sim_ros_interface
            cd sim_ros_interface

            git checkout melodic
            echo -e "sim_rosi/HokuyoReading\\nsim_rosi/ManipulatorJoints\\nsim_rosi/RosiMovement\\nsim_rosi/RosiMovementArray" \
                 >> meta/messages.txt
            
            # Atualização das dependências do sim_ros_interface
            cp ${ROSI_INSTALL_ROOT}/config/package.xml package.xml
            cp ${ROSI_INSTALL_ROOT}/config/CMakeLists.txt CMakeLists.txt
        )
    )

    catkin build
)

# Inserção das bibliotecas compiladas no CoppeliaSim
cp ${ROS_CATKIN_WS}/devel/lib/libsimExtROSInterface.so ${COPPELIASIM_ROOT_DIR}
cp ${ROS_CATKIN_WS}/devel/lib/libv_repExtRosVelodyne.so ${COPPELIASIM_ROOT_DIR}
