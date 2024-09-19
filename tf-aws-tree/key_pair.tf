resource "tls_private_key" "tls-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "key-pair" {
  key_name   = "my-key"
  public_key = tls_private_key.tls-key.public_key_openssh
}
