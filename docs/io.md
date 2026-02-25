# Inputs and Outputs: terraform-digitalocean-droplet

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `name` | Name (e.g. `app` or `cluster`). | `string` | `""` | no |
| `environment` | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| `label_order` | Label order, e.g. `name`, `application`. | `list(any)` | `["name", "environment"]` | no |
| `managedby` | ManagedBy, e.g. `terraform-do-modules` or `hello@clouddrove.com`. | `string` | `"terraform-do-modules"` | no |
| `enabled` | Flag to control the droplet creation. | `bool` | `true` | no |
| `region` | The region in which to create the Droplet, e.g. `blr1`. | `string` | `"blr1"` | no |
| `droplet_count` | The number of Droplets to create. | `number` | `1` | no |
| `droplet_size` | The size slug of the Droplet size (e.g. `s-1vcpu-1gb`). | `string` | `"s-1vcpu-1gb"` | no |
| `image_name` | The image name or slug to use for the Droplet. | `string` | `"ubuntu-22-04-x64"` | no |
| `vpc_uuid` | The ID of the VPC where the Droplet will be located. | `string` | `""` | no |
| `ssh_keys` | Map of SSH keys to create. Each entry has optional `name` and `public_key`. | `map(object({ name = optional(string), public_key = optional(string) }))` | `{}` | no |
| `user_data` | A cloud-init compatible user data script for the Droplet. | `string` | `null` | no |
| `backups` | Boolean controlling if automated backups are enabled. | `bool` | `false` | no |
| `monitoring` | Boolean controlling whether the DigitalOcean monitoring agent is installed. | `bool` | `false` | no |
| `ipv6` | Boolean controlling if IPv6 is enabled on the Droplet. | `bool` | `false` | no |
| `resize_disk` | Boolean controlling whether to increase the disk size when resizing a Droplet. | `bool` | `true` | no |
| `droplet_agent` | Boolean controlling whether to install the DigitalOcean agent for web console access. | `bool` | `false` | no |
| `graceful_shutdown` | Boolean indicating whether the Droplet should be gracefully shut down before deletion. | `bool` | `false` | no |
| `floating_ip` | Boolean to control whether a reserved (floating) IP should be created per Droplet. | `bool` | `false` | no |
| `block_storage_size` | The size of the block storage volume in GiB (can only be expanded after creation). | `number` | `5` | no |
| `block_storage_filesystem_type` | Initial filesystem type (`xfs` or `ext4`) for the block storage volume. | `string` | `null` | no |
| `block_storage_filesystem_label` | Initial filesystem label for the block storage volume. | `string` | `"data"` | no |
| `enable_firewall` | Enable Cloud Firewall with configurable inbound and outbound rules. | `bool` | `true` | no |
| `inbound_rules` | List of inbound firewall rule objects with `allowed_ip`, `allowed_ports`, and optional `protocol`. | `any` | `[]` | no |
| `outbound_rule` | List of outbound firewall rule objects with `protocol`, `port_range`, and `destination_addresses`. | `list(object({...}))` | All TCP/UDP egress to `0.0.0.0/0` and `::/0` | no |
| `tags` | A list of tags to apply to the Droplet. | `list(any)` | `[]` | no |

---

## Outputs

| Name | Description |
|------|-------------|
| `id` | The ID of each Droplet (list). |
| `urn` | The uniform resource name of each Droplet (list). |
| `name` | The name of each Droplet (list). |
| `locked` | Whether each Droplet is locked (list). |
| `size` | The instance size slug of each Droplet (list). |
| `disk` | The disk size in GB of each Droplet (list). |
| `vcpus` | The number of virtual CPUs of each Droplet (list). |
| `status` | The status of each Droplet (list). |
| `tags` | The tags associated with each Droplet (list). |
| `ipv6` | Whether IPv6 is enabled on each Droplet (list). |
| `ipv4_address` | The public IPv4 address of each Droplet (list). |
| `ipv6_address` | The IPv6 address of each Droplet (list). |
| `region` | The region of each Droplet (list). |
| `ipv4_address_private` | The private networking IPv4 address of each Droplet (list). |
| `price_hourly` | The hourly price of each Droplet (list). |
| `price_monthly` | The monthly price of each Droplet (list). |
| `ssh_keys` | Map of created SSH keys with `id`, `name`, `fingerprint`, and `public_key` per key. |
| `public_ip_address` | The reserved (floating) IP address, if created. |
