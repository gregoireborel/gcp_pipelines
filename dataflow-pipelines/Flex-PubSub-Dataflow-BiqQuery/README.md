# Flex-PubSub-Dataflow-BiqQuery-batch
## What is it?
Flex-PubS ub-Dataflow-BiqQuery-batch is batch pipeline designed to : 
- Read session_start and session_end files from GCS
- Process the data
- Write processed data to the SESSION BigQuery table
- Copy successfully processed files to archive/ folder
- Copy corrupted files to error/ folder  

## How to develop/update the dataflow job?
When you modify the BigQuery table schema, you should also update the `data_model.proto` file. Then compile it using the following command:
```bash
protoc --python_out=. data_model.proto
```
  
If `protoc` is not found. Please install the `protobuf` package.  
For Mac OS users, you can install it with `brew` :
```bash
brew install protobuf
```

## How to build/run the dataflow job?
Build Flex-PubSub-Dataflow-BiqQuery-batch:
```bash
python Flex-PubSub-Dataflow-BiqQuery-batch.py \
--runner DataflowRunner \
--project gia-develop-int-94070 \
--template_location gs://gia-develop-dataflow-templates/templates/Flex-PubSub-Dataflow-BiqQuery-batch \
--staging_location gs://gia-develop-dataflow-templates/staging \
--temp_location gs://gia-develop-dataflow-templates/temp \
--region europe-west2 \
--setup_file ./setup.py \
--save_main_session \
--bucket_name gia-develop-datalake-crm-customer-mparticle \
--destination_project_id gia-develop-data-01107 \
--dataset gia_develop_datawarehouse_crm_customer \
--dataset_errors gia_develop_crm_customer_error_records \
--table SESSION \
--service_account_email 511438648610-compute@developer.gserviceaccount.com
```

Run Flex-PubSub-Dataflow-BiqQuery-batch:
```bash
gcloud dataflow jobs run Flex-PubSub-Dataflow-BiqQuery-batch \
    --gcs-location gs://gia-develop-dataflow-templates/templates/Flex-PubSub-Dataflow-BiqQuery-batch \
    --region europe-west2 \
    --subnetwork https://www.googleapis.com/compute/v1/projects/gia-develop-host-54723/regions/europe-west2/subnetworks/gia-develop-europe-west2-subnet
```
