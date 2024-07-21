#!/usr/bin/env bash

# Exit when any command fails
set -euo pipefail

PROJECT=gborel-sample-project
LOCATION=europe-west1
PIPELINE=${PWD##*/}  
BUCKET="gb-dataflow-flex-templates"
MODE=$1
ENV=develop
CI_FILE_CONTENT=$(cat ci/$MODE/${ENV}_parameters.txt | sed 's/--parameters /--/g')

# Use DirectRunner first for quick development and testing
# Currently, using DataflowRunner in local with a python package doesn't work.
python -m main \
  --project="$PROJECT" \
  --job_name="local-$PIPELINE-`date +%Y-%m-%d-%H%M%S`" \
  --runner=DirectRunner \
  --region "$LOCATION" \
  --setup_file ./setup.py \
  --temp-location "gs://$BUCKET/temp" \
  --staging-location "gs://$BUCKET/staging" $(echo $CI_FILE_CONTENT)
  
