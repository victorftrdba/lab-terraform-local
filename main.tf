terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = "test"
  secret_key = "test"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  endpoints {
    s3  = "http://localhost:4566"
    sqs = "http://localhost:4566"
  }
}

# Chamada do Módulo S3
module "data_lake" {
  source      = "./modules/s3"
  bucket_name = "${var.project_name}-bucket"
  tags        = var.common_tags
}

# Chamada do Módulo SQS
module "processing_queue" {
  source            = "./modules/sqs"
  queue_name        = "${var.project_name}-queue"
  delay_seconds     = 10
  retention_seconds = 86400
  tags              = var.common_tags
}
