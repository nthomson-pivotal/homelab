#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

pwd

tar zxf director-state/state-0.tgz

#$DIR/../../../start.sh