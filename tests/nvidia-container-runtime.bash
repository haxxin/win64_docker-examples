#!/usr/bin/env bash
#
#
#

# shellcheck disable=SC2034
args0="/bin/sh -c 'ls -lhas /'";
# shellcheck disable=SC2034
args1="nvidia-smi -L";
# shellcheck disable=SC2034
image0=ubuntu;
# shellcheck disable=SC2034
image1=nvidia/cuda:11.4.3-base-ubuntu20.04;
# shellcheck disable=SC2034
image2=nvidia/cuda:12.8.1-base-ubuntu20.04;
# shellcheck disable=SC2034
image3=nvidia/cuda:12.8.1-runtime-ubuntu20.04;
docker run --gpus all \
  --device /dev/nvidia0:/dev/nvidia0 --device /dev/nvidia-modeset:/dev/nvidia-modeset --device /dev/nvidia-uvm:/dev/nvidia-uvm \
  --device /dev/nvidia-uvm-tools:/dev/nvidia-uvm-tools --device /dev/nvidiactl:/dev/nvinvidiactl \
--rm -it $image1 $args1
# GPU 0: NVIDIA GeForce GT 710 (UUID: GPU-46ce22de-fdfc-0f38-7ee9-5999ef0711d3)
docker run --gpus all \
  --device /dev/nvidia0:/dev/nvidia0 --device /dev/nvidia-modeset:/dev/nvidia-modeset --device /dev/nvidia-uvm:/dev/nvidia-uvm \
  --device /dev/nvidia-uvm-tools:/dev/nvidia-uvm-tools --device /dev/nvidiactl:/dev/nvinvidiactl \
--rm -it $image3 $args1
