#!/bin/bash

# Exit when any command fails
set -eu pipefail

PROJECT=gborel-sample-project
# No uppercase letters
PIPELINE=flex-pubsub-dataflow-biqquery
# In dev environment, no need to accumulate images. 'latest' is used to override the previous image. 
TAG=latest
CONTAINER_IMAGE="europe-west9-docker.pkg.dev/$PROJECT/dataflow-flex-templates-images/$PIPELINE:$TAG"
BUCKET="gb-dataflow-flex-templates"
TEMPLATE_FILE=gs://$BUCKET/$PIPELINE.json

# Build and push Docker image to Artifact Registry
gcloud builds submit --gcs-log-dir gs://gborel-cloudbuilds-logs --tag $CONTAINER_IMAGE . 
# Build JSON template file
gcloud dataflow flex-template build $TEMPLATE_FILE \
    --image $CONTAINER_IMAGE \
    --sdk-language "PYTHON" \
    --metadata-file=metadata.json