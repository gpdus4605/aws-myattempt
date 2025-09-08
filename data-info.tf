data "aws_region" "current" {} 

data "aws_caller_identity" "current" {} 

data "aws_vpc" "default" { 
  default = true 
} 

data "aws_subnets" "default" { 
  filter { 
    name   = "vpc-id" 
    values = [data.aws_vpc.default.id] 
  } 
} 

data "aws_ami" "latest_amazon_linux" { 
  most_recent = true 
  owners      = ["amazon"] 
  filter { 
    name   = "name" 
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] 
  }
}   