#Module      : Label
#Description : This terraform module is designed to generate consistent label names and
#              tags for resources. You can use terraform-labels to implement a strict
#              naming convention.
module "labels" {
  source      = "terraform-do-modules/labels/digitalocean"
  version     = "1.0.3"
  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
}
