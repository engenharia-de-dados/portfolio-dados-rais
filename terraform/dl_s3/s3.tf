provider "aws" {
  region = "us-east-1"
}

variable "dl_s3_bucket_name" {
  type    = string
  default = "vplentz-dl-dev"
}

resource "aws_s3_bucket" "data_bucket" {
  bucket = var.dl_s3_bucket_name
  force_destroy = true
}

resource "aws_iam_user" "dl_s3_user" {
  name = "DLS3User"
}

resource "aws_iam_policy" "data_lake_s3_iam_policy" {
  name = "DataLakeS3IAMPolicy"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:GetBucketTagging",
                "s3:DeleteObjectVersion",
                "s3:GetObjectVersionTagging",
                "s3:RestoreObject",
                "s3:ListBucket",
                "s3:GetObjectVersionAttributes",
                "s3:GetBucketPolicy",
                "s3:ReplicateObject",
                "s3:GetObjectVersionTorrent",
                "s3:GetObjectAcl",
                "s3:DeleteJobTagging",
                "s3:PutBucketTagging",
                "s3:UpdateJobPriority",
                "s3:GetObjectVersionAcl",
                "s3:GetObjectTagging",
                "s3:PutObjectTagging",
                "s3:DeleteObject",
                "s3:PutBucketVersioning",
                "s3:DeleteObjectTagging",
                "s3:GetObjectRetention",
                "s3:GetBucketWebsite",
                "s3:GetJobTagging",
                "s3:GetObjectAttributes",
                "s3:PutJobTagging",
                "s3:PutObjectLegalHold",
                "s3:UpdateJobStatus",
                "s3:DeleteObjectVersionTagging",
                "s3:GetBucketVersioning",
                "s3:GetBucketAcl",
                "s3:GetObjectLegalHold",
                "s3:PutObject",
                "s3:GetObject",
                "s3:GetObjectTorrent",
                "s3:DeleteStorageLensConfiguration",
                "s3:PutObjectRetention",
                "s3:GetObjectVersionForReplication",
                "s3:ReplicateDelete",
                "s3:GetObjectVersion"
            ],
            "Resource": [
                "arn:aws:s3:::vplentz-dl-dev",
                "arn:aws:s3:::*/*",
                "arn:aws:s3:*:647723971581:job/*",
                "arn:aws:s3:*:647723971581:storage-lens/*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:GetAccessPoint",
                "s3:CreateJob"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "dl_iam_policy_bind" {
  name = "DLIAMPolicyBind"
  users = [aws_iam_user.dl_s3_user.name]
  policy_arn = aws_iam_policy.data_lake_s3_iam_policy.arn
}

resource "aws_iam_access_key" "dl_iam_access_key" {
  user    = aws_iam_user.dl_s3_user.name
}

output "aws_s3_data_bucket" {
  value = aws_s3_bucket.data_bucket.arn
}
output "aws_dl_s3_user_id" {
  value = aws_iam_access_key.dl_iam_access_key.id
}
output "aws_dl_s3_user_secret" {
  value = aws_iam_access_key.dl_iam_access_key.secret
}
