resource "aws_route_table_association" "prod_public_rt_assoc" {
  subnet_id      = aws_subnet.Public_subnet_1.id
  route_table_id = aws_route_table.prod_public_rt.id
}

resource "aws_route_table_association" "prod_private_rt_assoc" {
  subnet_id      = aws_subnet.Private_subnet_1.id
  route_table_id = aws_route_table.prod_private_rt.id
}
