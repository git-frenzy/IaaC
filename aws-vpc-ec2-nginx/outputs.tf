output "server_public_ip" {
  value = aws_instance.server.public_ip
}


output "server_url" {
  value = "http://${aws_instance.server.public_ip}"
}
