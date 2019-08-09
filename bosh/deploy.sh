#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

$DIR/caddy/deploy.sh
$DIR/postgres/deploy.sh
$DIR/minio/deploy.sh
$DIR/concourse/deploy.sh
$DIR/vault/deploy.sh
$DIR/kubo/deploy.sh
$DIR/prometheus/deploy.sh