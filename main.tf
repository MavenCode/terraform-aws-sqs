resource "aws_sqs_queue" "queue" {
  name = var.name
  policy = var.policy
}
