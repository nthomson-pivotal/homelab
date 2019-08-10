#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $DIR/common.sh

tmp_jumpbox_ssh_file="$(mktemp)"

director_ip="$(bosh int "$DIR/vars.yml" --path="/internal_ip")"

bosh int $STATE_DIR/creds.yml --path /jumpbox_ssh/private_key > "${tmp_jumpbox_ssh_file}"
chmod 600 "${tmp_jumpbox_ssh_file}"
ssh jumpbox@$director_ip -i "${tmp_jumpbox_ssh_file}" 'sudo /var/vcap/bosh/bin/monit restart all'