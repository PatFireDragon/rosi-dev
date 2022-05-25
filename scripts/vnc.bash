#!/bin/bash

apt-get install -y ubuntu-gnome-desktop tightvncserver

cp ./setup/files/xstartup "/root/.vnc/xstartup"
chmod +x /root/.vnc/xstartup
