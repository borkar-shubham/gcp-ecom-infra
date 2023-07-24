module "vpc_network" {
  source = "git::https://github.com/borkar-shubham/Terraform/tree/main/gcp/modules/vpc.git"
  project_name = var.project_name
}

module "compute_engine" {
  source = "git::https://github.com/borkar-shubham/Terraform/tree/main/gcp/modules/compute_engine.git"
}