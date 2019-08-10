endpoint="https://minio.lab.paasify.org"

access_key=$(credhub get -n /bosh-lab/minio/minio_accesskey -j | jq -r '.value')
secret_key=$(credhub get -n /bosh-lab/minio/minio_secretkey -j | jq -r '.value')