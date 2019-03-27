#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

bosh delete-env ~/projects/bosh-deployment/bosh.yml \
    --state=$DIR/state.json \
    --vars-store=$DIR/creds.yml \
    -o ~/projects/bosh-deployment/vsphere/cpi.yml \
    -l $DIR/vars.yml