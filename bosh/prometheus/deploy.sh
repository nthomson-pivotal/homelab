#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

prometheus_deployment=$DIR/prometheus-boshrelease-24.1.0

export BOSH_DEPLOYMENT=prometheus

bosh -n deploy $prometheus_deployment/manifests/prometheus.yml \
  -o $prometheus_deployment/manifests/operators/monitor-bosh.yml \
  -o $prometheus_deployment/manifests/operators/enable-bosh-uaa.yml \
  -o $prometheus_deployment/manifests/operators/monitor-postgres.yml \
  -o $prometheus_deployment/manifests/operators/monitor-concourse.yml \
  -o $DIR/operations/external-postgres.yml \
  -o $DIR/operations/no-nginx.yml \
  -l $DIR/vars.yml