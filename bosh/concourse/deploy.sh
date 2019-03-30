#!/bin/bash

export BOSH_DEPLOYMENT=concourse

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

concourse_deployment=$DIR/concourse-bosh-deployment-5.0.1

bosh -n deploy $concourse_deployment/cluster/concourse.yml \
  -l $concourse_deployment/versions.yml \
  -o $concourse_deployment/cluster/operations/external-postgres.yml \
  -o $concourse_deployment/cluster/operations/basic-auth.yml \
  -o $concourse_deployment/cluster/operations/credhub.yml \
  -o $concourse_deployment/cluster/operations/prometheus.yml \
  -o $DIR/operations/remove-postgres-pass.yml \
  -l $DIR/vars.yml