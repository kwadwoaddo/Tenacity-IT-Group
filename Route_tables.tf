resource "aws_route_table" "prod_public_rt" {
  vpc_id                                                         = aws_vpc.tenacity_vpc.id

  route {
    cidr_block                                                   = "0.0.0.0/0"
    gateway_id                                                   = aws_internet_gateway.prod_igw.id
  }

  tags                                                           = {
    Name                                                         = "prod_public_rt"
  }
}

resource "aws_route_table" "prod_private_rt" {
  vpc_id                                                         = aws_vpc.tenacity_vpc.id

  route {
    cidr_block                                                   = "0.0.0.0/0"
    nat_gateway_id                                                   = aws_internet_gateway.prod_NAT_gateway.id
  }

  tags                                                           = {
    Name                                                         = "prod_private_rt"
  }
}

resource "aws_route_table_association" "prod_public_rt_assoc_1" {
  subnet_id                                                     = aws_subnet.prod_public_subnet_1.id
  route_table_id                                                = aws_route_table.prod_public_rt.id
}

resource "aws_route_table_association" "prod_public_rt_assoc_2" {
  subnet_id                                                     = aws_subnet.prod_public_subnet_2.id
  route_table_id                                                = aws_route_table.prod_public_rt.id
}

resource "aws_route_table_association" "prod_private_rt_assoc_1" {
  subnet_id                                                     = aws_subnet.prod_private_subnet_1.id
  route_table_id                                                = aws_route_table.prod_private_rt.id
}

resource "aws_route_table_association" "prod_private_rt_assoc_2" {
  subnet_id                                                     = aws_subnet.prod_private_subnet_2.id
  route_table_id                                                = aws_route_table.prod_private_rt.id
}
