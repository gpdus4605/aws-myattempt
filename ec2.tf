resource "aws_instance" "web_server" {
  ami = var.ec2_ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.main["subnet-pub-0"].id

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = file("web-init.sh")

  tags = {
    Name = "WebServer - ${var.instance_type}"
  }
}