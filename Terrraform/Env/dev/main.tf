data "aws_caller_identity" "current" {}

module "vpc" {
  source = "../../modules/vpc"

  project                  = "pharma"
  env                      = "dev"
  vpc_cidr                 = "10.0.0.0/16"
  public_subnet_cidrs      = ["10.0.1.0/24", "10.0.2.0/24"]
  private_eks_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  private_rds_subnet_cidrs = ["10.0.5.0/24", "10.0.6.0/24"]
}

module "ecr" {
  source = "../../modules/ecr"

  project = "pharma"
  env     = "dev"
  repositories = [
    
    "pharma-ui",
    "supplier-service",
    
  ]
}