#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://dev-api.stackbit.com/project/5dd4ff5e0bf2e4001278e644/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://dev-api.stackbit.com/pull/5dd4ff5e0bf2e4001278e644
curl -s -X POST https://dev-api.stackbit.com/project/5dd4ff5e0bf2e4001278e644/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://dev-api.stackbit.com/project/5dd4ff5e0bf2e4001278e644/webhook/build/publish > /dev/null
