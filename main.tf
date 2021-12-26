provider "aws" {
  region = "us-east-1"
}

locals {
  name   = "ug-dev-118"
  region = "us-east-1"

  tags = {
    Owner       = "rohit"
    Environment = "dev"
    projectid   = "118"
  }
}




################################################################################
# VPC Module
################################################################################

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.name
  cidr = "20.10.0.0/16"

  azs                 = ["${local.region}a", "${local.region}b"]
  private_subnets     = ["20.10.1.0/24", "20.10.2.0/24"]
  public_subnets      = ["20.10.11.0/24", "20.10.12.0/24"]
  
  enable_nat_gateway = true
  single_nat_gateway = true
		}



