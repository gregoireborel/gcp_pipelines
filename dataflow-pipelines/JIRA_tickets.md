# JIRA tickets
To setup Dataflow pipelines using custom Python package along with a Cloud Build CI/CD, here is the list of tasks to be performed:

We assume that each environment has its own dedidicated GCP project.

In develop GCP project:
1. Enable APIs for: Artifact Registry, Cloud Build, Dataflow
2. Create Artifact Registry Docker repository
3. Create Artifact Registry Python repository
4. Create Cloud Build Service Account with following roles:
5. Create Cloud Build 2nd gen trigger to Python package GitHub repository
6. Create Cloud Build 2nd gen trigger to Dataflow GitHub repository
