#!/bin/bash

# Exit when any command fails
set -euo pipefail

PROJECT=gborel-sample-project
REGION=europe-west1
# No uppercase letters
PIPELINE=dataflow-test-pipeline
# In dev environment, no need to accumulate images. 'latest' is used to override the previous image. 
TAG=latest
CONTAINER_IMAGE="$REGION-docker.pkg.dev/$PROJECT/dataflow-images/$PIPELINE:$TAG"
BUCKET="gb-dataflow-flex-templates"
TEMPLATE_FILE=gs://$BUCKET/$PIPELINE.json

# Build and push Docker image to Artifact Registry
gcloud builds submit --tag $CONTAINER_IMAGE . 
# Build JSON template file
gcloud dataflow flex-template build $TEMPLATE_FILE \
    --image $CONTAINER_IMAGE \
    --sdk-language "PYTHON"
    # --metadata-file=metadata.json