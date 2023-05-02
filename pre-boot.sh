#!/usr/bin/env bash

set -e
set -o errexit

export DEBIAN_FRONTEND=noninteractive

# Prerequisites
# Install git from ppa
# Install git-lfs from universe
sudo apt update \
 && sudo apt upgrade --fix-missing -y \
 && sudo apt install -y \
    jq gpg wget curl zlib1g-dev libssl-dev libcurl4-openssl-dev qt5-default exfat-utils \
    apt-transport-https ca-certificates gnupg-agent software-properties-common \
 && sudo add-apt-repository -y ppa:git-core/ppa && sudo apt update \
 && sudo apt install -y git git-lfs \
 && sudo apt autoremove -y

# Install latest CUDA and NVIDIA drivers
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda
