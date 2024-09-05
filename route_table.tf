resource "aws_route_table" "prod_public_rt" {
  vpc_id                                                        = aws_vpc.tenacity_vpc.id

  route {
    cidr_block                                                  = "0.0.0.0/0"
    gateway_id                                                  = aws_internet_gateway.prod_igw.id
  }
  
  tags                                                          = {
    Name                                                        = "prod_public_rt"
  }
}

resource "aws_route_table" "prod_private_rt" {
  vpc_id                                                        = aws_vpc.tenacity_vpc.id

  route {
    cidr_block                                                  = "0.0.0.0/0"
    nat_gateway_id                                              = aws_nat_gateway.prod_nat_gateway.id
  }

  
  tags = {
    Name = "prod_private_rt"
  }
}