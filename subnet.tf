resource "aws_subnet" "Public_subnet_1" {
  vpc_id                                            = aws_vpc.tenacity_vpc.id
  cidr_block                                        = "10.0.1.0/24"

  tags                                              = {
    Name                                            = "Public_subnet_1"
  }
}


resource "aws_subnet" "Private_subnet_1" {
  vpc_id                                            = aws_vpc.tenacity_vpc.id
  cidr_block                                        = "10.0.2.0/24"

  tags                                              = {
    Name                                            = "Private_subnet_1"
  }
}