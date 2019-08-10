#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

tar zxf director-state/state-0.tgz

export STATE_DIR=$(pwd)

export BOSH_CA_CERT=$(bosh int $STATE_DIR/creds.yml --path /director_ssl/ca)

source $DIR/../../../director/login.sh

env

bosh vms