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

# Check if a file argument is provided
if [ $# -eq 0 ]; then
  echo "Error: Please provide a file path as an argument."
  exit 1
fi

FILE_PATH="$1"

if [ ! -f "$FILE_PATH" ]; then
  echo "Error: File '$FILE_PATH' does not exist."
  exit 1
fi

if [ "$2" == "local" ]; then
  python -m main \
    --project=$PROJECT \
    --job_name="local-$PIPELINE-`date +%Y%m%d-%H%M%S`" \
    --runner=DataflowRunner \
    --region $REGION \
    --temp-location gs://$BUCKET/temp \
    --staging-location gs://$BUCKET/staging \
    --mode=batch \
    --bucket_name=les-chiens-bananes-media \
    --destination_project_id=gborel-sample-project \
    --dataset=gborel-sample-dataset \
    --dataset_errors=gborel-sample-dataset-errors \
    --table=BANANE

else
  gcloud dataflow flex-template run "$PIPELINE-`date +%Y%m%d-%H%M%S`" \
      --template-file-gcs-location $TEMPLATE_FILE \
      --region $REGION \
      --temp-location gs://$BUCKET/temp \
      --staging-location gs://$BUCKET/staging $(< "$FILE_PATH")
fi

