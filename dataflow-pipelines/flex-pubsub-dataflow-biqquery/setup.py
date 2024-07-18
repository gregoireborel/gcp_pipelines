# -*- coding: utf-8 -*-
import setuptools

PACKAGE_VERSION = "1.0.0"
PACKAGE_NAME = "flex-PubSub-Dataflow-BiqQuery-batch"

# List here only libraries your SDK won't work with! Here some examples
# Now if we install the package normally : pip install -e .
install_requires = [
    "apache-beam[gcp]==2.54.0",
    "google-api-core==2.15.0",
    "google-cloud-pubsub==2.19.0",
    "google-auth==2.26.2",
    "google-cloud-storage==2.14.0",
]

setuptools.setup(
    name=PACKAGE_NAME,
    packages=setuptools.find_packages(),
    version=PACKAGE_VERSION,
    description="flex-PubSub-Dataflow-BiqQuery-batch processing package.",
    python_requires=">=3.11",
    install_requires=install_requires,
)
