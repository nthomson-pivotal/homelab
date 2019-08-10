#SOURCE ME

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $DIR/common.sh

export BOSH_ENVIRONMENT=172.16.6.6
export BOSH_CLIENT=admin
export BOSH_CLIENT_SECRET=`bosh int $STATE_DIR/creds.yml --path /admin_password`
