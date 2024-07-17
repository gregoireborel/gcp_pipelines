#!/usr/bin/env bash

# Exit when any command fails
set -euo pipefail

echo "##### Run the Dataflow Flex Template $PIPELINE_NAME pipeline #####"

IMAGE_NAME=$(echo "$PIPELINE_NAME" | tr '[:upper:]' '[:lower:]')
CI_SERVICE_NAME_LOWER_CASE=$(echo "$CI_SERVICE_NAME" | tr '[:upper:]' '[:lower:]')
CI_FILE_PATH=dataflow-pipelines/$PIPELINE_NAME/ci/$MODE/${ENV}_parameters.txt

gcloud dataflow flex-template run "$IMAGE_NAME-$CI_SERVICE_NAME_LOWER_CASE-$(date +%Y-%m-%d:%H%M%S)" \
  --template-file-gcs-location "gs://$DATAFLOW_BUCKET/$PIPELINE_NAME-$CI_SERVICE_NAME.json" \
  --project="$PROJECT_ID" \
  --region="$LOCATION" \
  --temp-location="gs://$DATAFLOW_BUCKET/temp" \
  --staging-location="gs://$DATAFLOW_BUCKET/staging" $(cat $CI_FILE_PATH)