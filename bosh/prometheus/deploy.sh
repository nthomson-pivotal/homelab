#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export BOSH_DEPLOYMENT=prometheus

bosh -n deploy $DIR/prometheus-boshrelease-24.1.0/manifests/prometheus.yml \
  -o $DIR/operations/external-postgres.yml \
  -o $DIR/operations/no-nginx.yml \
  -l vars.yml