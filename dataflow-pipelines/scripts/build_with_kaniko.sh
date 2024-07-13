#!/bin/bash
# Exit when any command fails
set -euo pipefail

# Determine the changed folders
CHANGED_FOLDERS=$(git diff --name-only HEAD~1 HEAD | grep '^dataflow-pipelines/Flex' | cut -d/ -f2 | sort -u)

if [ -z "$CHANGED_FOLDERS" ]; then
    echo "No relevant changes detected, exiting."
    exit 0
fi

for folder in $CHANGED_FOLDERS; do
    echo "Building pipeline in folder: $folder"
    cd dataflow-pipelines/$folder

    IMAGE_NAME="${$folder,,}"
    echo "### Building Dataflow Docker image with Kaniko ###"

    /kaniko/executor \
    --use-new-run \
    --compressed-caching="false" \
    --single-snapshot \
    --context . \
    --dockerfile ./$folder/Dockerfile \
    --destination "$LOCATION-docker.pkg.dev/$PROJECT_ID/$REPO_NAME/$IMAGE_NAME/$CI_SERVICE_NAME:$IMAGE_TAG"

    # Go back to the root directory before processing the next folder
    cd - > /dev/null
done