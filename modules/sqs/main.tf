resource "aws_sqs_queue" "this" {
  name                      = var.queue_name
  delay_seconds             = var.delay_seconds
  message_retention_seconds = var.retention_seconds
  tags                      = var.tags
}
