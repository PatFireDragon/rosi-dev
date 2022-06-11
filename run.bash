#!/bin/bash

docker run --rm --net="host" -e DISPLAY=${DISPLAY} -it patfiredragon/rosi:latest