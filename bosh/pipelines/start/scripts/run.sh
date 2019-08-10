#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

tar zxf director-state/state-0.tgz

export STATE_DIR=$(pwd)

source $DIR/../../../director/login.sh

env

bosh vms