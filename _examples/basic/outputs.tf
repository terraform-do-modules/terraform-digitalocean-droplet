# ------------------------------------------------------------------------------
# Outputs
# ------------------------------------------------------------------------------
output "droplet_name" {
  value       = module.droplet[*].name
  description = "The name of the Droplet."
}
