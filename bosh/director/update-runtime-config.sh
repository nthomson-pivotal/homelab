#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

bosh -n update-runtime-config ~/projects/bosh-deployment/runtime-configs/dns.yml