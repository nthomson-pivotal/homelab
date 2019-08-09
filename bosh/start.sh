#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

bosh -n -d caddy start
bosh -n -d postgres start
bosh -n -d minio start
bosh -n -d concourse start
bosh -n -d vault start
bosh -n -d cfcr start
bosh -n -d prometheus start