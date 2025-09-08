output "aws_region" { 
  description = "The AWS region used for deployment." 
  value = data.aws_region.current.name 
} 
output "aws_account_id" { 
  description = "The AWS account ID used for deployment." 
  value = data.aws_caller_identity.current.account_id 
} 
output "default_vpc_id" { 
  description = "The ID of the default VPC." 
  value = data.aws_vpc.default.id 
} 
output "used_subnet_id" { 
  description = "The ID of the subnet used for the EC2 instance." 
  value = aws_instance.web_server.subnet_id 
} 
output "latest_ami_id" { 
  description = "The ID of the latest Amazon Linux 2 AMI found." 
  value = data.aws_ami.latest_amazon_linux.id 
} 
output "web_server_public_ip" { 
  description = "The public IP address of the created web server." 
  value = aws_instance.web_server.public_ip 
} 