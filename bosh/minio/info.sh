#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $DIR/common.sh

echo "Endpoint: $endpoint"
echo "Access Key: $access_key"
echo "Secret Key: $secret_key"

