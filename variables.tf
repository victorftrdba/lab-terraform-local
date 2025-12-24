variable "region" {
  default = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto para prefixar recursos"
  type        = string
}

variable "common_tags" {
  type = map(string)
  default = {
    Environment = "Local-Dev"
    ManagedBy   = "Terraform"
    Owner       = "Cloud-Engineer"
  }
}
