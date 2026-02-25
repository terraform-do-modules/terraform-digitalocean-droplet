# Architecture: terraform-digitalocean-droplet

## Overview

This module creates and manages DigitalOcean Droplets (virtual machines) along with associated infrastructure components. The module is designed to support one or more identically configured Droplets through a count-based pattern.

Resources created by this module:

- `digitalocean_ssh_key` — one SSH key per entry in the `ssh_keys` map (managed via `for_each`).
- `digitalocean_droplet` — one or more Droplets, each named using the labels-derived ID and a zero-based index.
- `digitalocean_volume` — one block storage volume per Droplet, attached automatically.
- `digitalocean_volume_attachment` — binds each volume to its corresponding Droplet.
- `digitalocean_reserved_ip` and `digitalocean_reserved_ip_assignment` — optional floating/reserved IPs when `floating_ip = true`.
- `digitalocean_firewall` — optional Cloud Firewall applied to all Droplets when `enable_firewall = true`.

---

## Naming and Tagging via labels.tf

The module delegates naming and tagging to the `terraform-do-modules/labels/digitalocean` sub-module, called in `labels.tf`. The labels module:

- Composes a normalized `id` from the `name`, `environment`, and `label_order` variables using a configurable delimiter (default `-`).
- Creates DigitalOcean Tags for `name`, `environment`, and `managedby`.

The composed `module.labels.id` is used as the prefix for all resource names (e.g. `app-test-droplet-0`, `app-test-volume-0`, `app-test-droplet-firewall`). This ensures consistent naming across all resources in the module and across all modules in a project that share the same labels convention.

`locals.tf` builds a `ssh_key_ids` list from the created `digitalocean_ssh_key` resources and passes it to the `ssh_keys` argument of each Droplet.

---

## User Data for Bootstrapping

The `user_data` variable accepts a cloud-init compatible script string. This is the standard mechanism for bootstrapping Droplets at first boot. Common uses include:

- Installing system packages.
- Configuring the hostname or DNS resolver.
- Pulling and starting a Docker container.
- Joining a configuration management system.

Pass the content of a shell script using Terraform's `file()` function:

```hcl
user_data = file("user-data.sh")
```

User data is only applied once at Droplet creation. Changes to `user_data` after creation force a replacement of the Droplet.

---

## VPC Placement

Placing Droplets inside a VPC is strongly recommended for production environments. Set the `vpc_uuid` variable to the UUID of an existing DigitalOcean VPC. This ensures:

- Droplet private IP addresses are isolated from the public internet.
- Inter-Droplet communication over private addresses stays within the VPC.
- Firewall inbound rules can target the VPC CIDR block rather than the public IP.

Use the `terraform-digitalocean-vpc` module to create the VPC and pass `module.vpc.id` to this module's `vpc_uuid` input.

---

## Firewall Configuration

When `enable_firewall = true` (the default), a Cloud Firewall is created and applied to all Droplets. The firewall is configured with:

- **Inbound rules**: Defined via the `inbound_rules` variable. Each rule specifies `allowed_ip` (list of CIDRs) and `allowed_ports` (port or range string) and optionally `protocol`.
- **Outbound rules**: Defined via the `outbound_rule` variable. The default allows all TCP and UDP egress to `0.0.0.0/0` and `::/0`.

To restrict inbound access, supply explicit rules. For example, to allow SSH only from within a VPC CIDR:

```hcl
inbound_rules = [
  {
    allowed_ip    = ["10.10.0.0/16"]
    allowed_ports = "22"
  }
]
```

---

## Operational Checklist

- **SSH key management**: SSH keys are created as DigitalOcean account-level resources. Ensure the public key material is correct before applying; the private key is never stored in state.
- **Droplet resizing**: To resize without disk expansion, set `resize_disk = false`. Disk size increases are permanent and irreversible.
- **Backups**: Enable the `backups` variable for automated weekly backups. This incurs an additional cost of 20% of the Droplet price.
- **Monitoring**: Set `monitoring = true` to install the DigitalOcean metrics agent, which enables built-in alerting from the control panel.
- **Volume expansion**: Block storage volumes can only be expanded, not shrunk. Increasing `block_storage_size` after creation will resize the underlying volume.
- **Floating IPs**: Reserved IPs persist independently of Droplets. When a Droplet is destroyed, the IP assignment is removed but the reserved IP is retained and continues to accrue charges unless explicitly destroyed.
- **Graceful shutdown**: Setting `graceful_shutdown = true` causes Terraform to issue a shutdown command before destroying the Droplet, allowing in-flight requests to complete.
- **Firewall defaults**: The default outbound rules permit all egress. For hardened environments, replace the default `outbound_rule` with a more restrictive set.
