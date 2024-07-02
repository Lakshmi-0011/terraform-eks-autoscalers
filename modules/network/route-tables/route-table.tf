resource "aws_route_table" "private" {
  count  = length(var.private_subnet_ids)
  vpc_id = var.vpc_id

  route {
    cidr_block     = var.default_cidr_block
    nat_gateway_id = element(var.nat_ids, count.index % length(var.nat_ids))
  }

  tags = {
    Name = "private-${count.index}"
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  count = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private[count.index].id
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

resource "aws_route_table_association" "public_subnet_associations" {
  count = length(var.public_subnet_ids)

  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.public.id
}