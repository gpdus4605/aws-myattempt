## Region ##
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-west-2"
}

## SUBNET ##
variable "subnets" {
  description = "Base subnet setting"
  type = map(object({
    cidr_block = string
    az = string
    is_public = bool
  }))

  default = {
    "subnet-pub-0" = {
      cidr_block = "192.168.0.0/24"
      az = "us-west-2a"
      is_public = true
    },

    "subnet-pub-1" = {
      cidr_block = "192.168.1.0/24"
      az = "us-west-2b"
      is_public = true
    },

    "subnet-pri-2" = {
      cidr_block = "192.168.2.0/24"
      az = "us-west-2a"
      is_public = false
    },

    "subnet-pri-3" = {
      cidr_block = "192.168.3.0/24"
      az = "us-west-2b"
      is_public = false
    }
  }
}

## EC2 ##
variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t3.micro"
}

variable "ec2_ami_id" {
  description = "AMI ID for us-west-2 region(Amazon linux 2023)"
  type = string
  default = "ami-01102c5e8ab69fb75"
}

variable "allowed_port_EC2-sg" {
  description = "SG ingress policy for EC2"
  type = list(string)
  default = ["22","80","443"]
}
