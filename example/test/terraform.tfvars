# queue module variables
name       = "s3-event-queue"
policy     = "test-policy.json"
bucket_arn = data.aws_s3_bucket.bucket_vars.arn
bucket_id  = data.aws_s3_bucket.bucket_vars.id
dependency = [data.aws_s3_bucket.bucket_vars.id] # = [] for no implenmentation
tag        = "terraform-IaC"
env        = "test"
# bucket resource test variables
bucket_name = "s3-bucket"
acl         = "private"
tag_name    = "terraform-IaC"
env_name    = "test"
