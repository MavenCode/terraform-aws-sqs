resource "aws_sqs_queue" "queue" {
  name   = var.name
  policy = var.policy

  tags = {
    "Name"         = var.tag_name
    "Environmeent" = var.env_name
  }
}
