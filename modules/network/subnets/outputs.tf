output "public_subnet_ids" {
  value = [for subnet in aws_subnet.subnet : subnet.id if subnet.map_public_ip_on_launch]
}

output "private_subnet_ids" {
  value = [for subnet in aws_subnet.subnet : subnet.id if !subnet.map_public_ip_on_launch]
}

output "subnet_ids" {
  value = aws_subnet.subnet[*].id
}