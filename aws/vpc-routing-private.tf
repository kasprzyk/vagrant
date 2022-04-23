resource "aws_route_table" "prv" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name      = "dor2-aws-1-route-prv"
    Group     = "networking"
    Terraform = true
  }
}

resource "aws_route_table_association" "prv-a" {
  subnet_id      = aws_subnet.prv-a.id
  route_table_id = aws_route_table.prv.id
}

resource "aws_route_table_association" "prv-b" {
  subnet_id      = aws_subnet.prv-b.id
  route_table_id = aws_route_table.prv.id
}
