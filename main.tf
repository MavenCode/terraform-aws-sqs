resource "aws_sqs_queue" "queue" {
  name = var.name

  tags = {
    "Name"         = var.tag_name
    "Environmeent" = var.env_name
  }
}

data "template_file" "sqs_policy_template" {
  template = file("${path.module}/default-policy.json.tpl")

  vars = {
    bucket_arn = var.bucket_arn
  }
}

resource "aws_sqs_queue_policy" "sqs_policy" {
  queue_url = aws_sqs_queue.queue.id

  policy = data.template_file.sqs_policy_template.rendered
}

# resource "aws_s3_bucket notification" "bucket_notification" {
#   count = var.dependency ? 1 : 0

#   bucket = var.bucket_id
#   depends_on = [
#     var.dependency
#   ]

#   queue {
#     id            = aws_sqs_queue.queue.id
#     queue_arn     = aws_sqs_queue.queue.arn
#     events        = ["s3:ObjectCreated:*"]
#     filter_suffix = ".log"

#   }
# }
