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
    