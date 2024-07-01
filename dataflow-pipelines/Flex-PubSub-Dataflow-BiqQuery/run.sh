#!/bin/bash

# Exit when any command fails
set -eu #o pipefail

PROJECT=gborel-sample-project
REGION=europe-west9
# No uppercase letters
PIPELINE=flex-pubsub-dataflow-biqquery
# In dev environment, no need to accumulate images. 'latest' is used to override the previous image. 
TAG=latest
CONTAINER_IMAGE="europe-west9-docker.pkg.dev/$PROJECT/dataflow-flex-templates-images/$PIPELINE:$TAG"
BUCKET="gb-dataflow-flex-templates"
TEMPLATE_FILE=gs://$BUCKET/$PIPELINE.json

# Check if a file argument is provided
if [ $# -eq 0 ]; then
  echo "Error: Please provide a file path as an argument."
  exit 1
fi

# Store the file path in a variable
FILE_PATH="$1"

# Check if the file exists
if [ ! -f "$FILE_PATH" ]; then
  echo "Error: File '$FILE_PATH' does not exist."
  exit 1
fi

# Read the file content
FILE_CONTENT=$(< "$FILE_PATH")

gcloud dataflow flex-template run "$PIPELINE-`date +%Y%m%d-%H%M%S`" \
    --template-file-gcs-location $TEMPLATE_FILE \
    --region $REGION \
    --temp-location gs://$BUCKET/temp \
    --staging-location gs://$BUCKET/staging $FILE_CONTENT