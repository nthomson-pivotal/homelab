#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export BOSH_DEPLOYMENT=minio

bosh -n deploy -d minio $DIR/manifest.yml