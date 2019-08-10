#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $DIR/common.sh

$DIR/../director/credhub-login.sh

credhub set -t value -n /concourse/main/minio-accesskey -v ${access_key}
credhub set -t value -n /concourse/main/minio-secretkey -v ${secret_key}