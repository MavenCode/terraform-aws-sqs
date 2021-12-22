output "bucket_id" {
  value = data.aws_s3_bucket.bucket_vars.id
}

output "bucket_arn" {
  value = aws_s3_bucket.storage.arn
}
