variable "bucket_name" {
  description = "Nome do bucket"
  type        = string
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}
