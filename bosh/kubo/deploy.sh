#!/bin/bash

export BOSH_DEPLOYMENT=cfcr

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

kubo_deployment=$DIR/kubo-deployment

bosh -n update-config --name cfcr-cc-vm_extension-vsphere \
  ${kubo_deployment}/manifests/cloud-config/iaas/vsphere/use-vm-extensions.yml \
  --type cloud

bosh -n deploy $kubo_deployment/manifests/cfcr.yml \
  -o $kubo_deployment/manifests/ops-files/add-hostname-to-master-certificate.yml \
  -o $kubo_deployment/manifests/ops-files/vm-types.yml \
  -o $kubo_deployment/manifests/ops-files/iaas/vsphere/cloud-provider.yml \
  -o $kubo_deployment/manifests/ops-files/iaas/vsphere/use-vm-extensions.yml \
  -o $DIR/operations/set-scale.yml \
  -l $DIR/vars.yml