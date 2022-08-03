#!/usr/bin/env bash

set -eo pipefail

export AWS_DEFAULT_REGION=us-east-1
export AWS_REGION=us-east-1
export AWS_PROFILE=production

export TWINE_USERNAME=aws
export TWINE_PASSWORD=$(aws codeartifact get-authorization-token --domain flared --domain-owner 409905535292 --query authorizationToken --output text)
export TWINE_REPOSITORY_URL=$(aws codeartifact get-repository-endpoint --domain flared --domain-owner 409905535292 --repository pypi-private --format pypi --query repositoryEndpoint --output text)

twine upload build/oso/languages/python/oso/dist/*linux_aarch64.whl
