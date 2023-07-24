module "vpc_network" {
  source = "https://github.com/borkar-shubham/Terraform/tree/main/gcp/modules/vpc"
  project_name = var.project_name
}

module "compute_engine" {
  source = "./modules/compute_engine"
}