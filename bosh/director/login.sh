#!/bin/bash

#SOURCE ME

export BOSH_ENVIRONMENT=lab
export BOSH_CLIENT=admin
export BOSH_CLIENT_SECRET=`bosh int ./creds.yml --path /admin_password`