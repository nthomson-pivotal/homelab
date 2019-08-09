#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

$DIR/concourse/target.sh

fly -t lab set-pipeline -n -p deploy-caddy -c $DIR/caddy/pipeline.yml
fly -t lab set-pipeline -n -p deploy-postgres -c $DIR/postgres/pipeline.yml
fly -t lab set-pipeline -n -p deploy-minio -c $DIR/minio/pipeline.yml
fly -t lab set-pipeline -n -p deploy-prometheus -c $DIR/prometheus/pipeline.yml
fly -t lab set-pipeline -n -p deploy-kubo -c $DIR/kubo/pipeline.yml
fly -t lab set-pipeline -n -p deploy-vault -c $DIR/vault/pipeline.yml