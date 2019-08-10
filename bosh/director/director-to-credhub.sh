#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $DIR/common.sh

tmp_import_file="$(mktemp)"

vars-to-credhub --prefix /concourse/main/director --vars-file $STATE_DIR/creds.yml > "${tmp_import_file}"

credhub import -f "${tmp_import_file}"