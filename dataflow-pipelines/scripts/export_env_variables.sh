#!/bin/bash

# Exit when any command fails
set -euo pipefail

echo "### Setting up env variables ###" 

# Check if the build was triggered by a push to the main branch
if [ "$1" != "main" ]; then
    PROJECT_ID=gborel-sample-project
    BUCKET="gb-dataflow-flex-templates-develop"
else
    PROJECT_ID=gborel-sample-project-staging
    BUCKET="gb-dataflow-flex-templates-staging"
fi

LOCATION=europe-west1
REPO_NAME=dataflow-images
IMAGE_TAG=latest