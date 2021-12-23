module "aws_sqs_queue" {
  source     = "git::https://MavenCode/terraform-aws-sqs.git"
  sqs_name   = var.name
  bucket_arn = data.aws_s3_bucket.bucket_vars.arn
  bucket_id  = data.aws_s3_bucket.bucket_vars.id
  dependency = [aws_s3_bucket.storage.id] # = [] for no implenmentation

  # tags value for IaC and env: dev, prod or test
  tag_name = var.tag_name
  env_name = var.env_name
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
