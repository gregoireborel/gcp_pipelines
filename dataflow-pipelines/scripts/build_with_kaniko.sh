#!/busybox/sh
# Exit when any command fails
set -euo pipefail

if [ -s /workspace/changed_folders ]; then
    while IFS="" read -r folder || [ -n "$folder" ]
    do
        echo "##### Building pipeline in folder: $folder "#####
        cd ../$folder

        IMAGE_NAME=$(echo "$folder" | tr '[:upper:]' '[:lower:]')
        echo "##### Building Dataflow Docker image $IMAGE_NAME with Kaniko"#####

        /kaniko/executor \
        --cache=true \
        --destination "$LOCATION-docker.pkg.dev/$PROJECT_ID/$DOCKER_REPO_NAME/$IMAGE_NAME:latest"

        # Go back to the root directory before processing the next folder
        cd - > /dev/null
    done < /workspace/changed_folders
else
    echo "No changes to pipeline code detected"
fi