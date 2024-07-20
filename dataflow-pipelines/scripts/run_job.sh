#!/usr/bin/env bash

# Exit when any command fails
set -euo pipefail

echo "##### Run the Dataflow Flex Template $PIPELINE_NAME pipeline #####"

CLEAN_BRANCH_NAME=$(echo "$BRANCH_NAME" | tr '[:upper:]' '[:lower:]')
CLEAN_BRANCH_NAME="${CLEAN_BRANCH_NAME////-}"

echo "CLEAN BRANCH NAME $CLEAN_BRANCH_NAME"

TEMPLATE_NAME=${PIPELINE_NAME}_${CLEAN_BRANCH_NAME}_${CI_SERVICE_NAME}
CI_FILE_PATH=dataflow-pipelines/$PIPELINE_NAME/ci/$MODE/${ENV}_parameters.txt

gcloud dataflow flex-template run "$TEMPLATE_NAME-$(date +%Y-%m-%d-%H%M%S)" \
  --template-file-gcs-location "gs://$DATAFLOW_BUCKET/$TEMPLATE_NAME.json" \
  --project="$PROJECT_ID" \
  --region="$LOCATION" \
  --temp-location="gs://$DATAFLOW_BUCKET/temp" \
  --staging-location="gs://$DATAFLOW_BUCKET/staging" $(cat $CI_FILE_PATH)