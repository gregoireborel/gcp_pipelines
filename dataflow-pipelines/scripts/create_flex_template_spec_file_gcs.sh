#!/bin/bash
# Exit when any command fails
set -euo pipefail

if [ -s /workspace/changed_folders ]; then
    while IFS="" read -r folder || [ -n "$folder" ]
    do
        IMAGE_NAME=$(echo "$folder" | tr '[:upper:]' '[:lower:]')
        echo "##### Building JSON specificaton file for $folder Docker image #####"

        gcloud dataflow flex-template build "gs://$DATAFLOW_BUCKET/$folder-$CI_SERVICE_NAME.json" \
        --image "$LOCATION-docker.pkg.dev/$PROJECT_ID/$DOCKER_REPO_NAME/$IMAGE_NAME:latest" \
        --sdk-language "$SDK_LANGUAGE"
        #--metadata-file "$METADATA_FILE"
    done < /workspace/changed_folders
    rm /workspace/changed_folders
else
    echo "No changes to pipeline code detected"
fi