module "vpc_network" {
  source = "./modules/vpc"
  project_name = var.project_name
}

module "compute_engine" {
  source = "./modules/compute_engine"
}