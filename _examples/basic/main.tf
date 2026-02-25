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
  source      = "terraform-do-modules/vpc/digitalocean"
  version     = "1.0.0"
  name        = local.name
  environment = local.environment
  region      = local.region
  ip_range    = "10.10.0.0/16"
}

##------------------------------------------------
## Droplet module call — minimal/basic
## Single Droplet with SSH key, placed in VPC.
## No firewall rules, no block volume customization.
##------------------------------------------------
module "droplet" {
  source = "./../../"

  name        = local.name
  environment = local.environment
  region      = local.region

  vpc_uuid = module.vpc.id

  ssh_keys = {
    "app-key" = {
      public_key = file("~/.ssh/id_rsa.pub")
    }
  }

  droplet_size = "s-1vcpu-1gb"
  image_name   = "ubuntu-22-04-x64"

  # Disable firewall for the basic example
  enable_firewall = false
}
