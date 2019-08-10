#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $DIR/common.sh

credhub_admin_secret=$(bosh int "$STATE_DIR/creds.yml" --path="/credhub_admin_client_secret")

credhub_api_url="https://$(bosh int "$DIR/vars.yml" --path="/internal_ip"):8844"

tmp_uaa_ca_file="$(mktemp)"
tmp_credhub_ca_file="$(mktemp)"

bosh int "$STATE_DIR/creds.yml" --path="/uaa_ssl/ca" > "${tmp_uaa_ca_file}"
bosh int "$STATE_DIR/creds.yml" --path="/credhub_tls/ca" > "${tmp_credhub_ca_file}"

set +x
credhub login --client-name credhub-admin --client-secret "${credhub_admin_secret}" -s "${credhub_api_url}" --ca-cert "${tmp_credhub_ca_file}" --ca-cert "${tmp_uaa_ca_file}"