#!/bin/bash

apt-get update
apt-get upgrade
apt-get -y install software-properties-common lsb-release

add-apt-repository ppa:deadsnakes/ppa
apt-get update
apt-get -y install curl gnupg python3.8 python3-pip git build-essential wget