# -*- coding: utf-8 -*-
import setuptools

PACKAGE_VERSION = "1.0.0"
PACKAGE_NAME = "flex-pubsub-dataflow-bigquery-batch"

with open('requirements.in') as f:
    requirements = f.read().splitlines()

# List here only libraries your SDK won't work with! Here some examples
# Now if we install the package normally : pip install -e .
# install_requires = [
#     "apache-beam[gcp]==2.57.0",
#     "gborelpy==0.4.0"
# ]

setuptools.setup(
    name=PACKAGE_NAME,
    description=f"{PACKAGE_NAME} processing package.",
    version=PACKAGE_VERSION,
    python_requires=">=3.11",
    install_requires=requirements,
    packages=setuptools.find_packages(),
)
