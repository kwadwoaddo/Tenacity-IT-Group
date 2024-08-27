provider "aws" {
  region = "eu-west-2"
}
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}
resource "aws_subnet" "Prod-pub-sub1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-2a"

  tags = {
    Name = "Prod-pub-sub1"
  }
}
resource "aws_subnet" "Prod-pub-sub2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.10.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-2a"

  tags = {
    Name = "Prod-pub-sub2"
  }
}
resource "aws_subnet" "Prod-priv-sub1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "Prod-priv-sub1"
  }
}
resource "aws_subnet" "Prod-priv-sub2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "Prod-priv-sub2"
  }
}
# Public Route Table
resource "aws_route_table" "Prod-pub-route-table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Prod-pub-route-table"
  }
}

# Private Route Table
resource "aws_route_table" "Prod-priv-route-table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Prod-priv-route-table"
  }
}
# Associate Public Subnet 1 with Public Route Table
resource "aws_route_table_association" "Prod-pub-sub1-assoc" {
  subnet_id      = aws_subnet.Prod-pub-sub1.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}

# Associate Public Subnet 2 with Public Route Table
resource "aws_route_table_association" "Prod-pub-sub2-assoc" {
  subnet_id      = aws_subnet.Prod-pub-sub2.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}

# Associate Private Subnet 1 with Private Route Table
resource "aws_route_table_association" "Prod-priv-sub1-assoc" {
  subnet_id      = aws_subnet.Prod-priv-sub1.id
  route_table_id = aws_route_table.Prod-priv-route-table.id
}

# Associate Private Subnet 2 with Private Route Table
resource "aws_route_table_association" "Prod-priv-sub2-assoc" {
  subnet_id      = aws_subnet.Prod-priv-sub2.id
  route_table_id = aws_route_table.Prod-priv-route-table.id
}
# Internet Gateway
resource "aws_internet_gateway" "Prod-igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Prod-igw"
  }
}
# Adding a default route to the public route table to direct traffic to the Internet Gateway
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.Prod-pub-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.Prod-igw.id
}
# Elastic IP for NAT Gateway
resource "aws_eip" "Prod-Nat-eip" {
  vpc = true

  tags = {
    Name = "Prod-Nat-eip"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "Prod-Nat-gateway" {
  allocation_id = aws_eip.Prod-Nat-eip.id
  subnet_id     = aws_subnet.Prod-pub-sub1.id

  tags = {
    Name = "Prod-Nat-gateway"
  }
}
# Adding a route to the private route table to direct traffic to the NAT Gateway
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.Prod-priv-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.Prod-Nat-gateway.id
}
