#!/bin/bash

# Exit when any command fails
set -euo pipefail

PROJECT=gborel-sample-project
LOCATION=europe-west1
PIPELINE=${PWD##*/}  
BUCKET="gb-dataflow-flex-templates"
MODE=batch
ENV=develop
CI_FILE_PATH=ci/$MODE/${ENV}_parameters.txt
IMAGE_NAME=$(echo "$PIPELINE" | tr '[:upper:]' '[:lower:]') # Convert to lowercase

python -m main \
  --project="$PROJECT" \
  --job_name="local-$IMAGE_NAME-`date +%Y-%m-%d:%H%M%S`" \
  --runner=DirectRunner \
  --region "$LOCATION" \
  --temp-location "gs://$BUCKET/temp" \
  --staging-location "gs://$BUCKET/staging" \
  --mode=batch \
  --bucket_name=les-chiens-bananes-media \
  --destination_project_id=gborel-sample-project \
  --dataset=gborel-sample-dataset \
  --dataset_errors=gborel-sample-dataset-errors \
  --table=BANANE
