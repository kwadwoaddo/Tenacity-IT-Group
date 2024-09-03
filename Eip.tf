resource "aws_eip" "prod_eip" {
  vpc = true

  tags = {
    Name = "prod_eip"
  }
}