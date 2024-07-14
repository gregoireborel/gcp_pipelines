#!/busybox/sh
# Exit when any command fails
set -euo pipefail

_LOCATION=$1
_PROJECT_ID=$2
_DOCKER_REPO_NAME=$3

if [ -s /workspace/changed_folders ]; then
    while IFS="" read -r folder || [ -n "$folder" ]
    do
        echo "##### Building pipeline in folder: $folder "#####
        cd ../$folder

        _IMAGE_NAME=$(echo "$folder" | tr '[:upper:]' '[:lower:]')
        echo "##### Building Dataflow Docker image $_IMAGE_NAME with Kaniko"#####

        /kaniko/executor \
        --cache=true \
        --destination "$_LOCATION-docker.pkg.dev/$_PROJECT_ID/$_DOCKER_REPO_NAME/$_IMAGE_NAME:latest"

        # Go back to the root directory before processing the next folder
        cd - > /dev/null
    done < /workspace/changed_folders
else
    echo "No changes to pipeline code detected"
fi