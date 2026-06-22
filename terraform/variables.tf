variable "aws_region" {
  description = "AWS region for infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
  default     = "tja-project-key"
}

variable "volume_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 15
}

variable "ssh_key_path" {
  description = "Path to the SSH private key on the Ansible control node"
  type        = string
  default     = "~/keys/tja-project-key.pem"
}


variable "instances" {

  description = "Map of instance names to AMI IDs, SSH users, and OS family"
  
  type = map(object({
    ami       = string
    user      = string
    os_family = string
    instance_type = string
  }))

  # by deafult value to be put in the variable
  default = {
    "tja-project-control" = {
      ami       = "ami-0b6d9d3d33ba97d99" # Ubuntu Server 24.04 LTS
      user      = "ubuntu"
      os_family = "ubuntu"
      instance_type = "t3.micro"
    }
    "tja-worker-redhat" = {
      ami       = "ami-00adafae70b8029d8" # RHEL 9 
      user      = "ec2-user"
      os_family = "redhat"
      instance_type = "t3.micro"
    }
    "tja-worker-amazon" = {
      ami       = "ami-0521cb2d60cfbb1a6" # Amazon Linux 2023 — update for your region
      user      = "ec2-user"
      os_family = "amazon"
      instance_type = "t3.micro"
    }
  }
}