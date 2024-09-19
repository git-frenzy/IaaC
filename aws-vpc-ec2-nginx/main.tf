resource "aws_instance" "server" {
  ami                         = "ami-0e86e20dae9224db8"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.sg-1.id]
  associate_public_ip_address = true

  user_data = <<-EOF
            #!/bin/bash
            sudo apt install nginx -y
            sudo systemctl start nginx
            EOF

  tags = {
    Name = "nginx-server"
  }
}
