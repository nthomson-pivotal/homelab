#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $DIR/director/login.sh

bosh -n -d prometheus stop --hard
bosh -n -d cfcr stop --hard
bosh -n -d vault stop --hard
bosh -n -d concourse stop --hard
bosh -n -d minio stop --hard
bosh -n -d postgres stop --hard
bosh -n -d caddy stop --hard