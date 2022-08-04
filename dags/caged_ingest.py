from airflow.providers.amazon.aws.transfers.ftp_to_s3 import FTPToS3Operator
from airflow import models
from airflow.decorators import task

from datetime import datetime

with models.DAG(
    "caged_ingest",
    schedule_interval="@monthly",
    start_date=datetime(2019, 1, 1),
    end_date=datetime(2019, 12, 1),
    max_active_runs=1,
    catchup=True,
) as dag:
    file_path = "/pdet/microdados/CAGED/{{ macros.ds_format(ds, '%Y-%m-%d', '%Y') }}/CAGEDEST_{{ macros.ds_format(ds, '%Y-%m-%d', '%m%Y') }}.7z"
    
    @task(task_id="print_the_context")
    def print_context(file_path):
        """Print the Airflow context and ds variable from the context."""
        print(file_path)
        
    print_context(file_path)

    ftp_to_s3_task = FTPToS3Operator(
        task_id="ftp_to_s3_task",
        ftp_conn_id = 'caged_rais_ftp',
        aws_conn_id = 'aws_conn', 
        ftp_path=file_path,
        s3_bucket= "vplentz-dl-dev", # SHOULD GET THIS AS AN VARIABLE
        s3_key="landing_zone" + file_path
    )