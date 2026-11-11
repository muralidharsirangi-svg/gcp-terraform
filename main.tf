module "network" {
  source = "./modules/network"

  project_id    = var.project_id
  network_name  = var.network_name
  subnet_name   = var.subnet_name
  region        = var.region
  subnet_cidr   = var.subnet_cidr
  webserver_tag = var.webserver_tag
}

module "webserver" {
  source = "./modules/webserver"

  project_id       = var.project_id
  instance_name    = var.instance_name
  zone             = var.zone
  machine_type     = var.machine_type
  subnet_self_link = module.network.subnet_self_link
  network_tags     = [var.webserver_tag]
}

module "webserver_2" {
  source = "./modules/webserver"

  project_id       = var.project_id
  instance_name    = var.second_instance_name
  zone             = var.zone
  machine_type     = var.machine_type
  subnet_self_link = module.network.subnet_self_link
  network_tags     = [var.webserver_tag]
}
