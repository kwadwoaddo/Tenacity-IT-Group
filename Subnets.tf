resource "aws_subnet" "prod_public_subnet_1" {
  vpc_id                                                        = aws_vpc.tenacity_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone                                             = "eu-west-2a"  # Specify the availability zone here
  map_public_ip_on_launch                                       = true          # Automatically assigns a public IP to instances launched in this subnet

  tags                                                          = {
    Name                                                        = "prod_public_subnet_1"
  }
}

resource "aws_subnet" "prod_public_subnet_2" {
  vpc_id                                                        = aws_vpc.tenacity_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone                                             = "eu-west-2b"  # Specify the availability zone here
  map_public_ip_on_launch                                       = true          # Automatically assigns a public IP to instances launched in this subnet

  tags                                                          = {
    Name                                                        = "prod_public_subnet_1"
  }
}

resource "aws_subnet" "prod_private_subnet_1" {
  vpc_id                                                        = aws_vpc.tenacity_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone                                             = "eu-west-2c"  # Specify the availability zone here
  map_public_ip_on_launch                                       = false          # Automatically assigns a public IP to instances launched in this subnet

  tags                                                          = {
    Name                                                        = "prod_private_subnet_1"
  }
}

resource "aws_subnet" "prod_private_subnet_2" {
  vpc_id                                                        = aws_vpc.tenacity_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone                                             = "eu-west-2a"  # Specify the availability zone here
  map_public_ip_on_launch                                       = false          # Automatically assigns a public IP to instances launched in this subnet

  tags                                                          = {
    Name                                                        = "prod_private_subnet_2"
  }
}