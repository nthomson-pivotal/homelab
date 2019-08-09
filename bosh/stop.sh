#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $DIR/director/login.sh

for deployment in $(bosh deployments --json | jq -r '.Tables[].Rows[].name'); do
  bosh -n -d $deployment stop --hard
done