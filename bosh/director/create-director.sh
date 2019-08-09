#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

vsphere_password=$1

if [ -z "$vsphere_password" ]; then
  echo "Error: Must supply vSphere password"
  exit 1
fi

$DIR/deploy-director.sh $vsphere_password

source $DIR/login.sh

bosh alias-env lab -e $(bosh int "$DIR/vars.yml" --path="/internal_ip") --ca-cert <(bosh int $DIR/state/creds.yml --path /director_ssl/ca)

# Xenial Stemcell
bosh -n upload-stemcell --sha1 9723f506c44f100c949b5bd7734d539168d3696e https://bosh.io/d/stemcells/bosh-vsphere-esxi-ubuntu-xenial-go_agent?v=250.23

# Trusty Stemcell
bosh -n upload-stemcell --sha1 87851d1550022eab3550e732462699a20bf3513b https://bosh.io/d/stemcells/bosh-vsphere-esxi-ubuntu-trusty-go_agent?v=3586.91

$DIR/update-cloud-config.sh
$DIR/update-runtime-config.sh

$DIR/credhub-login.sh
$DIR/director-to-credhub.sh

echo "-----------------------------------"
echo "To login: source login.sh"
echo "-----------------------------------"