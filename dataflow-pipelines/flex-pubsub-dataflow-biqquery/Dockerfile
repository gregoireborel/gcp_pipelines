# https://github.com/gregoireborel/dataflow_docker_base_image
FROM europe-west1-docker.pkg.dev/gborel-sample-project/dataflow-images/dataflow-base-image:1.0.0

ARG PIPELINE_NAME
# Location to store the pipeline artifacts.
ARG WORKDIR=/template
WORKDIR ${WORKDIR}

COPY dataflow-pipelines/${PIPELINE_NAME}/requirements.in .
COPY dataflow-pipelines/${PIPELINE_NAME}/requirements.txt .
COPY dataflow-pipelines/${PIPELINE_NAME}/setup.py .
COPY dataflow-pipelines/${PIPELINE_NAME}/main.py .
COPY dataflow-pipelines/${PIPELINE_NAME}/app app

# Installing exhaustive list of dependencies from a requirements.txt
# helps to ensure that every time Docker container image is built,
# the Python dependencies stay the same. Using `--no-cache-dir` reduces image size.
RUN pip install --no-cache-dir -r requirements.txt

# Installing the pipeline package makes all modules encompassing the pipeline
# available via import statements and installs necessary dependencies.
# Editable installation allows picking up later changes to the pipeline code
# for example during local experimentation within the container.
RUN pip install -e .

# For more informaiton, see: https://cloud.google.com/dataflow/docs/guides/templates/configuring-flex-templates
ENV FLEX_TEMPLATE_PYTHON_PY_FILE="${WORKDIR}/main.py"

# Because this image will be used as custom sdk container image, and it already 
# installs the dependencies from the requirements.txt, we can omit
# the FLEX_TEMPLATE_PYTHON_REQUIREMENTS_FILE directive here
# to reduce pipeline submission time.
# Similarly, since we already installed the pipeline package,
# we don't have to specify the FLEX_TEMPLATE_PYTHON_SETUP_FILE="${WORKDIR}/setup.py" configuration option.

# Optionally, verify that dependencies are not conflicting.
# A conflict may or may not be significant for your pipeline.
RUN pip check

# Optionally, list all installed dependencies.
# The output can be used to seed requirements.txt for reproducible builds.
RUN pip freeze

# Set the entrypoint to Apache Beam SDK launcher, which allows this image
# to be used as an SDK container image.
ENTRYPOINT ["/opt/apache/beam/boot"]