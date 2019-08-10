#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $DIR/common.sh

vsphere_password=$1

if [ -z "$vsphere_password" ]; then
  echo "Error: Must supply vSphere password"
  exit 1
fi

bosh delete-env ~/projects/bosh-deployment/bosh.yml \
    --state=$STATE_DIR/state.json \
    --vars-store=$STATE_DIR/creds.yml \
    -o ~/projects/bosh-deployment/vsphere/cpi.yml \
    -o ~/projects/bosh-deployment/jumpbox-user.yml \
    -o ~/projects/bosh-deployment/misc/dns.yml \
    -o ~/projects/bosh-deployment/uaa.yml \
    -o ~/projects/bosh-deployment/credhub.yml \
    -o $DIR/operations/concourse-uaa.yml \
    -v vcenter_password=$vsphere_password \
    -l $DIR/vars.yml