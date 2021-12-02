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

variable "name" { type = string }
variable "policy" { type = string }
variable "bucket_arn" { type = string }
variable "bucket_id" { type = string }
variable "dependency" { type = list(string) }
variable "tag" { type = string }
variable "env" { type = string }
