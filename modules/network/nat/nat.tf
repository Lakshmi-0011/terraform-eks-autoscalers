resource "aws_eip" "nat" {
  #vpc = true

  tags = {
    Name = var.eip-name
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnet_id

  tags = {
    Name = var.nat-name
  }
}