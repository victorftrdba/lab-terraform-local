output "data_lake_bucket_name" {
  description = "Nome do bucket do data lake"
  value       = module.data_lake.bucket_name
}

output "processing_queue_name" {
  description = "Nome da fila de processamento"
  value       = module.processing_queue.queue_name
}
