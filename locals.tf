locals {
  ssh_key_ids = [for key, ssh_key in digitalocean_ssh_key.ssh_keys : ssh_key.id]

}