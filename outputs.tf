output "queue" {
  value = aws_sqs_queue.queue
}

output "queue_id" {
  value = aws_sqs_queue.queue.id
}

output "queue_arn" {
  value = aws_sqs_queue.queue.arn
}
