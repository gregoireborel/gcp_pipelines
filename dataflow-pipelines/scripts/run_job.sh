#!/usr/bin/env bash

# Exit when any command fails
set -euo pipefail

echo "##### Run the Dataflow Flex Template $PIPELINE_NAME pipeline #####"

CI_FILE_PATH=dataflow-pipelines/$PIPELINE_NAME/ci/$MODE/${ENV}_parameters.txt

gcloud dataflow flex-template run "$PIPELINE_NAME-$CI_SERVICE_NAME-$(date +%Y-%m-%d-%H%M%S)" \
  --template-file-gcs-location "gs://$DATAFLOW_BUCKET/$PIPELINE_NAME-$CI_SERVICE_NAME.json" \
  --project="$PROJECT_ID" \
  --region="$LOCATION" \
  --temp-location="gs://$DATAFLOW_BUCKET/temp" \
  --num-workers=4 \
  --staging-location="gs://$DATAFLOW_BUCKET/staging" $(cat $CI_FILE_PATH)