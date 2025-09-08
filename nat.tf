resource "aws_nat_gateway" "main" {
  subnet_id = aws_subnet.main["subnet-pub-0"].id

  tags = {
    Name = "nat-gw"
  }

  depends_on = [aws_internet_gateway.main]
}