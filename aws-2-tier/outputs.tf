output "server1_instance_id" {
  value = aws_instance.server1.id
}

output "server2_instance_id" {
  value = aws_instance.server2.id
}

output "server1_instance_public_ip" {
  value = aws_instance.server1.public_ip
}

output "server2_instance_public_ip" {
  value = aws_instance.server2.public_ip
}

output "vpc_id" {
  value = aws_vpc.vpc-1.id
}

output "subnet_ids" {
  value = [
    aws_subnet.private-subnet1.id,
    aws_subnet.public-subnet1.id,
    aws_subnet.private-subnet2.id,
    aws_subnet.public-subnet2.id,
  ]
}

output "elb_dns_name" {
  value = aws_elb.elb.dns_name
}
