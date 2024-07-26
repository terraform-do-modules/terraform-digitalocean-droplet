# ------------------------------------------------------------------------------
# Outputs
# ------------------------------------------------------------------------------
output "id" {
  value       = digitalocean_droplet.main[*].id
  description = "The ID of the Droplet."
}

output "urn" {
  value       = digitalocean_droplet.main[*].urn
  description = "The uniform resource name of the Droplet."
}

output "name" {
  value       = digitalocean_droplet.main[*].name
  description = "The name of the Droplet."
}

output "locked" {
  value       = digitalocean_droplet.main[*].locked
  description = "Is the Droplet locked."
}

output "size" {
  value       = digitalocean_droplet.main[*].size
  description = "The instance size."
}

output "disk" {
  value       = digitalocean_droplet.main[*].disk
  description = "The size of the instance's disk in GB."
}

output "vcpus" {
  value       = digitalocean_droplet.main[*].vcpus
  description = "The number of the instance's virtual CPUs."
}

output "status" {
  value       = digitalocean_droplet.main[*].status
  description = "The status of the Droplet."
}

output "tags" {
  value       = digitalocean_droplet.main[*].tags
  description = "The tags associated with the Droplet."
}

output "ipv6" {
  value       = digitalocean_droplet.main[*].ipv6
  description = "Is IPv6 enabled."
}

output "ipv4_address" {
  value       = digitalocean_droplet.main[*].ipv4_address
  description = "The IPv4 address."
}

output "ipv6_address" {
  value       = digitalocean_droplet.main[*].ipv6_address
  description = "The IPv6 address."
}

output "region" {
  value       = digitalocean_droplet.main[*].region
  description = "The region of the Droplet."
}

output "ipv4_address_private" {
  value       = digitalocean_droplet.main[*].ipv4_address_private
  description = "The private networking IPv4 address."
}

output "price_hourly" {
  value       = digitalocean_droplet.main[*].price_hourly
  description = "Droplet hourly price."
}

output "price_monthly" {
  value       = digitalocean_droplet.main[*].price_monthly
  description = "Droplet hourly price."
}

#Module      : SSH KEY
#Description : Provides a DigitalOcean SSH key resource to allow you to manage SSH keys for Droplet access.
output "ssh_keys" {
  description = "SSH keys created in DigitalOcean"
  value = {
    for key, ssh_key in digitalocean_ssh_key.ssh_keys : # Using a for loop to iterate over each SSH key resource
    key => {
      id          = ssh_key.id
      name        = ssh_key.name
      fingerprint = ssh_key.fingerprint
      public_key  = ssh_key.public_key
    } if var.ssh_keys[key] != null # Check if the SSH key exists in var.ssh_keys
  }
}


output "public_ip_address" {
  description = "The IP Address of the resource"
  value       = try(digitalocean_reserved_ip.this[0].ip_address, null)

}
