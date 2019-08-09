#!/bin/bash

#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

kubo_deployment=$DIR/kubo-deployment-0.30.0

$kubo_deployment/bin/set_kubeconfig bosh-lab/cfcr https://api.kubo.lab.paasify.org

