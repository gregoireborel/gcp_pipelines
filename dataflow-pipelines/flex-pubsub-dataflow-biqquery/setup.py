# -*- coding: utf-8 -*-
import setuptools

PACKAGE_VERSION = "1.0.0"
PACKAGE_NAME = "flex-pubsub-dataflow-bigquery-batch"

# List here only libraries your SDK won't work with! Here some examples
# Now if we install the package normally : pip install -e .
install_requires = [
    "apache-beam[gcp]==2.57.0",
    "google-api-core==2.19.1",
    "google-cloud-pubsub==2.22.0",
    "google-auth==2.32.0",
    "google-cloud-storage==2.17.0"
]

setuptools.setup(
    name=PACKAGE_NAME,
    packages=setuptools.find_packages(),
    version=PACKAGE_VERSION,
    description=f"{PACKAGE_NAME} processing package.",
    python_requires=">=3.11",
    install_requires=install_requires,
)
