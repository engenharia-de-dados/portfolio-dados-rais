provider "aws" {
  region = "us-east-1"
}

variable "dl_s3_bucket_arn" {
  type = string
}

resource "aws_secretsmanager_secret" "dl_s3_bucket" {
  name = "AIRFLOW_VAR_DL_S3_BUCKET"
  description = "S3 bucket arn for the Data Lake"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "dl_s3_bucket_secret" {
  secret_id = aws_secretsmanager_secret.dl_s3_bucket.id
  secret_string = var.dl_s3_bucket_arn
}

resource "aws_secretsmanager_secret" "caged_rais_ftp_server" {
  name = "AIRFLOW_CONN_CAGED_RAIS_FTP"
  description = "CAGED/RAIS FTP server"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "caged_rais_ftp_server_secret" {
  secret_id = aws_secretsmanager_secret.caged_rais_ftp_server.id
  secret_string = "ftp://anonymous@ftp.mtps.gov.br"
}

variable "dl_s3_iam_user_id" {
  type = string
}

variable "dl_s3_iam_user_secret" {
  type = string
}

resource "aws_secretsmanager_secret" "aws_s3_iam" {
  name = "AIRFLOW_CONN_AWS_S3_IAM"
  description = "AWS S3 Credentials"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "aws_s3_iam_secret" {
  secret_id = aws_secretsmanager_secret.aws_s3_iam.id
  secret_string = "aws://${var.dl_s3_iam_user_id}:${var.dl_s3_iam_user_secret}@"
}