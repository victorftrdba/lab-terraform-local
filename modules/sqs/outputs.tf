output "queue_name" {
  description = "Nome da fila"
  value       = aws_sqs_queue.this.name
}

output "queue_arn" {
  description = "ARN da fila"
  value       = aws_sqs_queue.this.arn
}
