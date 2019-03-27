#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

$DIR/minio/delete.sh
$DIR/postgres/delete.sh
$DIR/caddy/delete.sh