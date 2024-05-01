terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket  = "piotr-leszczynski-big-data-solutions"
    key     = "state/terraform.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }

}

provider "aws" {
  region     = var.region
  access_key = var.accessKey
  secret_key = var.secretKey
}

