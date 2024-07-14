#!/bin/bash
# Exit when any command fails
set -euo pipefail

_LOCATION=$1
_PROJECT_ID=$2
_DOCKER_REPO_NAME=$3
_SDK_LANGUAGE=$4
_DATAFLOW_BUCKET=$5
_CI_SERVICE_NAME=$6

if [ -s /workspace/changed_folders ]; then
    while IFS="" read -r folder || [ -n "$folder" ]
    do
        _IMAGE_NAME=$(echo "$folder" | tr '[:upper:]' '[:lower:]')

        echo "##### Creating JSON specificaton file for $folder Docker image #####"

        gcloud dataflow flex-template build "gs://$_DATAFLOW_BUCKET/$folder-$_CI_SERVICE_NAME.json" \
        --image "$_LOCATION-docker.pkg.dev/$_PROJECT_ID/$_DOCKER_REPO_NAME/$_IMAGE_NAME:latest" \
        --sdk-language "$_SDK_LANGUAGE"
        #--metadata-file "$METADATA_FILE"
    done < /workspace/changed_folders
else
    echo "No changes to pipeline code detected"
fi