FROM gcr.io/dataflow-templates-base/python311-template-launcher-base

ARG WORKDIR=/template
RUN mkdir -p ${WORKDIR}
WORKDIR ${WORKDIR}

ENV PYTHONPATH ${WORKDIR}
ENV FLEX_TEMPLATE_PYTHON_SETUP_FILE="${WORKDIR}/setup.py"
ENV FLEX_TEMPLATE_PYTHON_PY_FILE="${WORKDIR}/main.py"

RUN pip install --no-cache-dir -U pip && \
    pip install --no-cache-dir -U keyrings.google-artifactregistry-auth

RUN pip install --no-cache-dir -U --index-url=https://europe-west9-python.pkg.dev/gborel-sample-project/python-repo/ gymshark

# This command must stay at the end of the file. More info at: https://cloud.google.com/build/docs/optimize-builds/kaniko-cache#example_using_kaniko_cache_in_a_nodejs_build
COPY . ${WORKDIR}/

# WORKDIR ${WORKDIR}/common/storage_write_api
# RUN protoc --python_out=. data_model.proto
# RUN [ ! -d /common/storage_write_api ]
#     && echo "Skipping protoc: /common/storage_write_api folder not found"
#     || protoc --proto_path=/common/storage_write_api/data_model.proto --python_out=/common/storage_write_api/

ENTRYPOINT ["/opt/google/dataflow/python_template_launcher"]