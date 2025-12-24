variable "queue_name" {
  description = "Nome da fila"
  type        = string
}

variable "delay_seconds" {
  description = "Delay em segundos"
  type        = number
}

variable "retention_seconds" {
  description = "Tempo de retenção em segundos"
  type        = number
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}
