#!/bin/bash

# O contêiner possui pacotes desatualizados
apt-get update
apt-get -y upgrade

# É necessário se inscrever ao ppa:deadsnakes para obter versões mais recentes do python (3.8)
apt-get -y install software-properties-common lsb-release
add-apt-repository ppa:deadsnakes/ppa
apt-get update

# Pacotes essenciais para os próximos scripts
apt-get -y install curl gnupg python3.8 python3-pip git build-essential wget
