resource "aws_security_group" "web_sg" {
  name = "web-server-sg"
  description = "No ingress policy but egress"
  vpc_id = aws_vpc.main.id

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

resource "aws_security_group_rule" "inbound_traffic" {
  for_each = toset(var.allowed_port_EC2-sg)

  type = "ingress"
  security_group_id = aws_security_group.web_sg.id
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  from_port = each.key
  to_port = each.key
}