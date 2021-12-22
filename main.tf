resource "aws_sqs_queue" "queue" {
  name = var.sqs_name

  tags = {
    "Name"         = var.tag_name
    "Environmeent" = var.env_name
  }
}

resource "aws_sqs_queue_policy" "sqs_policy" {
  queue_url = aws_sqs_queue.queue.id

  policy = data.template_file.sqs_policy_vars.rendered
}

# this resource is conditionally created if dependency var argument is supplied
# when instantianting a module.
# Used for data ingestion to subscribe raised bucket_notification to queue.
resource "aws_s3_bucket_notification" "bucket_notification" {
  depends_on = [
    var.dependency
  ]
  count  = var.dependency != [] ? 1 : 0
  bucket = var.bucket_id

  queue {
    id            = aws_sqs_queue.queue.id
    queue_arn     = aws_sqs_queue.queue.arn
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".log"

  }
}

# policy separation and template implementation.
data "template_file" "sqs_policy_vars" {
  template = file("${path.module}/${var.policy}")

  vars = {
    resource_arn = aws_sqs_queue.queue.arn
    bucket_arn   = var.bucket_arn
  }
}
