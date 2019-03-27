#!/bin/bash

export BOSH_DEPLOYMENT=cfcr

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

kubo_deployment=$DIR/kubo-deployment-0.30.0

bosh -n deploy $kubo_deployment/manifests/cfcr.yml \
  -o $kubo_deployment/manifests/ops-files/misc/scale-to-one-az.yml \
  -o $kubo_deployment/manifests/ops-files/add-hostname-to-master-certificate.yml \
  -o $kubo_deployment/manifests/ops-files/iaas/vsphere/master-static-ip.yml \
  -o $kubo_deployment/manifests/ops-files/vm-types.yml \
  -l $DIR/vars.yml