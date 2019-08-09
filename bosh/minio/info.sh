#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

access_key=$(credhub get -n /bosh-lab/minio/minio_accesskey -j | jq -r '.value')
secret_key=$(credhub get -n /bosh-lab/minio/minio_secretkey -j | jq -r '.value')

echo "Endpoint: https://minio.lab.paasify.org"
echo "Access Key: $access_key"
echo "Secret Key: $secret_key"

