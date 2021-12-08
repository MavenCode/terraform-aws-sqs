module "aws_sqs_queue" {
  source     = "https://github.com/MavenCode/terraform-aws-sqs/"
  name       = var.name
  policy     = var.policy
  bucket_arn = var.bucket_arn
  bucket_id  = var.bucket_id
  dependency = var.dependency

  # tags value for IaC and env: dev, prod or test
  tag_name = var.tag
  env_name = var.env
}
data "aws_s3_bucket" "bucket_vars" {
  bucket = aws_s3_bucket.storage.id
}

# s3 bucket resource declaration with full access permissions for dev-env
resource "aws_s3_bucket" "storage" {
  bucket        = "${var.bucket_name}-${random_string.random.result}"
  acl           = var.acl
  force_destroy = true

  # terraform-dev-env tag attached to all resources in test, dev or prod 
  tags = {
    Name        = var.tag_name
    Environment = var.env_name
  }
}

# random string appended to created uid for deployed s3 bucket
resource "random_string" "random" {
  length  = 6
  special = false
  upper   = false
}

variable "bucket_name" {}
variable "acl" {}
variable "tag_name" {}
variable "env_name" {}

variable "name" {}
variable "policy" {}
variable "bucket_arn" {}
variable "bucket_id" {}
variable "dependency" {}
variable "tag" {}
variable "env" {}
