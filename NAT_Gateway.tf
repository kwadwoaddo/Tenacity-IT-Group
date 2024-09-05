resource "aws_nat_gateway" "prod_nat_gateway" {
  allocation_id = aws_eip.prod_eip_1.id
  subnet_id     = aws_subnet.Public_subnet_1.id

  tags = {
    Name = "prod_nat_gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.prod_igw]
}