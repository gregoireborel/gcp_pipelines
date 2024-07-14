#!/busybox/sh
# Exit when any command fails
set -euo pipefail

echo $1
for folder in $1; do
    echo "Building pipeline in folder: $folder"
    cd $folder

    IMAGE_NAME="${$folder,,}"
    echo "### Building Dataflow Docker image with Kaniko ###"

    docker build -t ${_LOCATION}-docker.pkg.dev/$PROJECT_ID/${_DOCKER_REPO_NAME}/$IMAGE_NAME:latest '.'

    # /kaniko/executor \
    # --use-new-run \
    # --compressed-caching="false" \
    # --single-snapshot \
    # --context . \
    # --dockerfile ./$folder/Dockerfile \
    # --destination "$LOCATION-docker.pkg.dev/$PROJECT_ID/$_DOCKER_REPO_NAME/$IMAGE_NAME:latest"

    # Go back to the root directory before processing the next folder
    cd - > /dev/null
done