output "server_public_ip" {
  value = aws_instance.server-1.public_ip
}


output "server_url" {
  value = "http://${aws_instance.server-1.public_ip}"
}

output "private_key" {
  value = tls_private_key.tls-key.private_key_pem
  
  sensitive = true
}

data "aws_caller_identity" "name" {
  
}

output "caller_id" {
  value = data.aws_caller_identity.name
}


resource "local_file" "private_key_pem" {
  filename = "${path.module}/my-key.pem"
  content  = tls_private_key.tls-key.private_key_pem
  file_permission = "0600"
}
