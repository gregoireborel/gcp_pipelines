#!/usr/bin/env bash

# Exit when any command fails
set -euo pipefail

echo "##### Run the Dataflow Flex Template $3 pipeline #####"

IMAGE_NAME=$(echo "$PIPELINE_NAME" | tr '[:upper:]' '[:lower:]')

gcloud dataflow flex-template run "$PIPELINE_NAME-$CI_SERVICE_NAME-$(date +%Y%m%d-%H%M%S)" \
  --template-file-gcs-location "gs://$DATAFLOW_BUCKET/$IMAGE_NAME-$CI_SERVICE_NAME.json" \
  --project="$PROJECT_ID" \
  --region="$LOCATION" \
  --temp-location="$DATAFLOW_BUCKET/temp" \
  --staging-location="$DATAFLOW_BUCKET/staging" \ $(< "$FILE_PATH")