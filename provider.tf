terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
    humanitec = {
      source  = "humanitec/humanitec"
      version = ">= 0.3.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  region     = var.aws_credentials.region
  access_key = var.aws_credentials.access_key
  secret_key = var.aws_credentials.secret_key
}

provider "humanitec" {}  # Correção: sem o argumento `api_token`
