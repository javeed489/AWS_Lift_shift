variable "my_ip" {
  description = "Your public IP address in CIDR notation (e.g. 203.0.113.10/32)"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances (e.g. ami-0c02fb55956c7d316 for Amazon Linux 2 in us-east-1)"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "Name of the existing AWS key pair for SSH access"
  type        = string
}
