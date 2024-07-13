#!/bin/bash
# Exit when any command fails
set -euo pipefail

echo "### Creating spec file with flex-template-build ###"

gcloud dataflow flex-template build "$METADATA_TEMPLATE_FILE_PATH-$CI_SERVICE_NAME.json" \
  --image "$LOCATION-docker.pkg.dev/$PROJECT_ID/$REPO_NAME/$IMAGE_NAME/$CI_SERVICE_NAME:$IMAGE_TAG" \
  --sdk-language "$SDK_LANGUAGE" \
  --metadata-file "$METADATA_FILE"