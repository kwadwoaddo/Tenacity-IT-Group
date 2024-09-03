resource "aws_nat_gateway" "prod_NAT_gateway_1" {
  allocation_id                                                             = aws_eip.prod_eip.id
  subnet_id                                                                 = aws_subnet.prod_private_subnet_1.id

  tags                                                                      = {
    Name                                                                    = "prod_NAT_gateway_1"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.prod_igw]
}

resource "aws_nat_gateway" "prod_NAT_gateway_2" {
  allocation_id                                                             = aws_eip.prod_eip.id
  subnet_id                                                                 = aws_subnet.prod_private_subnet_2.id

  tags                                                                      = {
    Name                                                                    = "prod_NAT_gateway_2"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.prod_igw]
}