# https://github.com/gregoireborel/dataflow_docker_base_image
FROM europe-west1-docker.pkg.dev/gborel-sample-project/dataflow-images/dataflow-base-image:1.0.0

ARG WORKDIR=/template
WORKDIR ${WORKDIR}

ENV PYTHONPATH ${WORKDIR}
ENV FLEX_TEMPLATE_PYTHON_SETUP_FILE="${WORKDIR}/setup.py"
ENV FLEX_TEMPLATE_PYTHON_PY_FILE="${WORKDIR}/main.py"
# Since we already downloaded all the dependencies, there's no need to rebuild everything.
ENV PIP_NO_DEPS=True

# This command must stay at the end of the file. More info at: https://cloud.google.com/build/docs/optimize-builds/kaniko-cache#example_using_kaniko_cache_in_a_nodejs_build
COPY . ${WORKDIR}/

RUN ls -R

# WORKDIR ${WORKDIR}/common/storage_write_api
# RUN protoc --python_out=. data_model.proto
# RUN [ ! -d /common/storage_write_api ]
#     && echo "Skipping protoc: /common/storage_write_api folder not found"
#     || protoc --proto_path=/common/storage_write_api/data_model.proto --python_out=/common/storage_write_api/