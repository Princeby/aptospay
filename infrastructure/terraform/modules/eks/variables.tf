# modules/eks/variables.tf

variable "environment" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "cluster_sg_id" {
  type = string
}