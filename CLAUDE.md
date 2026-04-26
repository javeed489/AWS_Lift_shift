# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Terraform project for an AWS lift-and-shift migration, provisioning infrastructure in `us-east-1`.

## Common Commands

```bash
# Initialize providers
terraform init

# Preview changes
terraform plan -var-file="terraform.tfvars"

# Apply infrastructure
terraform apply -var-file="terraform.tfvars"

# Destroy infrastructure
terraform destroy -var-file="terraform.tfvars"
```

## File Structure

| File | Purpose |
|---|---|
| `providers.tf` | AWS provider config, region, and Terraform version constraints |
| `variables.tf` | Variable declarations |
| `terraform.tfvars` | Variable values (gitignored — never commit this) |
| `main.tf` | All resources: security groups and EC2 instances |

## Architecture

- **Region**: `us-east-1`
- **Provider**: `hashicorp/aws ~> 5.0`, Terraform `>= 1.3.0`
- **Security group** (`ssh_access`): allows inbound SSH (port 22) from `var.my_ip` only; all outbound allowed
- **EC2 instances**: 3 servers (WebServer, AppServer, DBServer) created via `count` meta-argument on a single `aws_instance.servers` resource, all sharing the same AMI, instance type, key pair, and security group

## Variables

| Variable | Description |
|---|---|
| `my_ip` | Your public IP in CIDR notation (e.g. `1.2.3.4/32`) — used to restrict SSH access |
| `ami_id` | AMI ID for EC2 instances |
| `instance_type` | EC2 instance type (e.g. `t3.micro`) |
| `key_pair_name` | Name of the AWS key pair for SSH access |

> `terraform.tfvars` is gitignored. To add a new server, append its name to `local.server_names` in `main.tf`.
