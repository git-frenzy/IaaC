resource "aws_instance" "server-1" {
  ami                         = "ami-0e86e20dae9224db8"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.sg-1.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.key-pair.key_name
  user_data                   = <<-EOF
            #!/bin/bash
            sudo apt install nginx -y
            sudo systemctl start nginx
            EOF

  tags = {
    Name = "server-1"
    Name = "test-server"
  }
}



# resource "aws_ebs_volume" "ebs-1" {
#   availability_zone = "us-east-1"
#   size              = 8

#   tags = {
#     Name = "ebs-1"
#     Name = "test-server"
#   }
# }

# resource "aws_volume_attachment" "ebs-mount" {
#   device_name = "/dev/sdf"
#   volume_id   = aws_ebs_volume.ebs-1.id
#   instance_id = aws_instance.server-1.id
# }



