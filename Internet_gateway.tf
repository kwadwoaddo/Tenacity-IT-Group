resource "aws_internet_gateway" "prod_igw" {
  vpc_id = aws_vpc.tenacity_vpc.id

  tags = {
    Name = "prod_igw"
  }
}