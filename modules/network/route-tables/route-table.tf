resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = var.default_cidr_block
    nat_gateway_id = var.nat_id
  }

  tags = {
    Name = "private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.default_cidr_block
    gateway_id = var.igw_id
  }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table_association" "private-subnet-1" {
  subnet_id      = var.private_subnet1_id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-subnet-2" {
  subnet_id      = var.private_subnet2_id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public-subnet-1" {
  subnet_id      = var.public_subnet1_id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-subnet-2" {
  subnet_id      = var.public_subnet2_id
  route_table_id = aws_route_table.public.id
}
