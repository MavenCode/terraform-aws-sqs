resource "aws_sqs_queue" "queue" {
  name   = var.name
  policy = var.policy

  tags = {
    "Name"         = var.tag_name
    "Environmeent" = var.env_name
  }
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  count = var.dependency ? 1 : 0

  bucket = var.bucket_id
  depends_on = [
    var.dependency
  ]

  queue {
    id            = aws_sqs_queue.queue.id
    queue_arn     = aws_sqs_queue.queue.arn
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".log"

  }
}
