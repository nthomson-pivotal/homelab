#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

vsphere_password=$1

if [ -z "$vsphere_password" ]; then
  echo "Error: Must supply vSphere password"
  exit 1
fi

bosh delete-env ~/projects/bosh-deployment/bosh.yml \
    --state=$DIR/state/state.json \
    --vars-store=$DIR/state/creds.yml \
    -o ~/projects/bosh-deployment/vsphere/cpi.yml \
    -o ~/projects/bosh-deployment/jumpbox-user.yml \
    -o ~/projects/bosh-deployment/misc/dns.yml \
    -o ~/projects/bosh-deployment/uaa.yml \
    -o ~/projects/bosh-deployment/credhub.yml \
    -o $DIR/operations/concourse-uaa.yml \
    -v vcenter_password=$vsphere_password \
    -l $DIR/vars.yml