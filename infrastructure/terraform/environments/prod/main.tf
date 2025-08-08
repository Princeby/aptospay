# environments/dev/main.tf

module "vpc" {
  source = "../../modules/vpc"

  environment     = var.environment
  vpc_cidr        = var.vpc_cidr
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
}

module "security_groups" {
  source = "../../modules/security-groups"

  environment = var.environment
  vpc_id      = module.vpc.vpc_id
}

module "eks" {
  source = "../../modules/eks"

  environment        = var.environment
  private_subnet_ids = module.vpc.private_subnet_ids
  public_subnet_ids  = module.vpc.public_subnet_ids
  cluster_sg_id      = module.security_groups.cluster_sg_id
}

# Outputs
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "kubeconfig_command" {
  value = "aws eks update-kubeconfig --region ${var.aws_region} --name ${module.eks.cluster_name}"
}
