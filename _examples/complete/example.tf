provider "digitalocean" {}

locals {
  name        = "app"
  environment = "test"
  region      = "blr1"
}

##------------------------------------------------
## VPC module call
##------------------------------------------------
module "vpc" {
  source      = "git::https://github.com/terraform-do-modules/terraform-digitalocean-vpc.git?ref=internal-423"
  name        = local.name
  environment = local.environment
  region      = local.region
  ip_range    = "10.10.0.0/16"
}

##------------------------------------------------
## Droplet module call
##------------------------------------------------
module "droplet" {
  source      = "./../../"
  name        = local.name
  environment = local.environment
  region      = local.region
  vpc_uuid    = module.vpc.id
  ssh_key     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAB= test"
  user_data   = file("user-data.sh")
  ####firewall
  inbound_rules = [
    {
      allowed_ip    = ["10.10.0.0/16"]
      allowed_ports = "22"
    },
    {
      allowed_ip    = ["0.0.0.0/0"]
      allowed_ports = "80"
    }
  ]
}