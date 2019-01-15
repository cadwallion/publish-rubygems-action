#!/bin/bash

echo "Setting up gem credentials..."
set +x
mkdir -p ~/.gem
cat << EOF > ~/.gem/credentials
---
:github: Bearer ${GITHUB_TOKEN}
:rubygems_api_key: ${RUBYGEMS_API_KEY}
EOF
set -x

echo "Running gem release task..."
release_command="${RELEASE_COMMAND:-rake release}"
exec $release_command
