# CLAUDE.md - lab-terraform-local

## O que é

Lab Terraform para provisionamento de infraestrutura AWS local via LocalStack (Docker), sem custos externos. Cria S3 (Data Lake) e SQS (filas) como base para um pipeline ETL completo em ambiente 100% isolado.

## Stack

- Terraform (HCL)
- LocalStack (emulação AWS local, porta 4566)
- AWS CLI / awslocal (AWSLocal CLI)
- Mailpit (captura de e-mails de teste, Docker)
- Docker Compose (orquestra LocalStack e Mailpit)

## Estrutura

```
main.tf              -> Configuração principal dos recursos AWS
variables.tf         -> Declaração de variáveis
outputs.tf           -> Outputs dos recursos provisionados
terraform.tfvars     -> Valores das variáveis (não commitar secrets)
terraform.tfstate    -> State local gerado pelo terraform apply
modules/s3/          -> Módulo Terraform para buckets S3 (Data Lake)
modules/sqs/         -> Módulo Terraform para filas SQS
```

## Comandos

```bash
terraform init               # Inicializar providers
terraform plan               # Visualizar mudanças
terraform apply              # Provisionar infraestrutura no LocalStack
terraform destroy            # Destruir recursos
```

## Padrões

- Provider aponta para `http://localhost:4566` (LocalStack), nunca para AWS real
- Módulos isolados por serviço (s3/, sqs/) com inputs/outputs explícitos
- `terraform.tfvars` define endpoint local; não commitar credenciais reais
- Lab integrado com pipeline-etl-localstack e data-validator-app (repos externos)
