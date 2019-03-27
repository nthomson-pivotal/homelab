#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

bosh -n create-env ~/projects/bosh-deployment/bosh.yml \
    --state=$DIR/state/state.json \
    --vars-store=$DIR/state/creds.yml \
    -o ~/projects/bosh-deployment/vsphere/cpi.yml \
    -o ~/projects/bosh-deployment/jumpbox-user.yml \
    -o ~/projects/bosh-deployment/misc/dns.yml \
    -o ~/projects/bosh-deployment/uaa.yml \
    -o ~/projects/bosh-deployment/credhub.yml \
    -o $DIR/operations/concourse-uaa.yml \
    -l $DIR/vars.yml