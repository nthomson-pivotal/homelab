#!/bin/bash

set -e

apt-get update && apt-get upgrade -y

echo "ubuntu   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/ubuntu