#!/bin/bash

# docker build -t ccc/sr-car .

docker run --gpus 1 -it \
    -v /mnt/SQUANCHY-SSD/projects/machine-learning/sr/models:/content/models \
    -v /mnt/SQUANCHY-SSD/projects/machine-learning/sr/input:/content/input \
    -v /mnt/SQUANCHY-SSD/projects/machine-learning/sr/output:/content/output \
    ccc/sr-car /content/command.sh