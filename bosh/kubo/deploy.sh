#!/bin/bash

export BOSH_DEPLOYMENT=cfcr

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

kubo_deployment=$DIR/kubo-deployment-0.30.0

bosh -n deploy $kubo_deployment/manifests/cfcr.yml \
  -o $kubo_deployment/manifests/ops-files/add-hostname-to-master-certificate.yml \
  -o $kubo_deployment/manifests/ops-files/vm-types.yml \
  -o $DIR/operations/set-scale.yml \
  -l $DIR/vars.yml