#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export BOSH_DEPLOYMENT=vault

bosh -n deploy $DIR/manifest.yml \
  -l $DIR/vars.yml