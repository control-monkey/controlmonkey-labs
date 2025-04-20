provider "aws" {
  region = "us-east-1"
}

#Private bucket with versioning enabled
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = var.bucket_name
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

variable "bucket_name" {
  description = "The name of the bucket."
  type        = string
}