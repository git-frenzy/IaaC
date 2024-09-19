resource "aws_instance" "server1" {
  ami                         = "ami-0522ab6e1ddcc7055"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-subnet1.id
  vpc_security_group_ids      = [aws_security_group.sg-1.id]
  associate_public_ip_address = true

  user_data = <<-EOF
            #!/bin/bash
            sudo apt install nginx -y
            sudo systemctl start nginx
            EOF

  tags = {
    Name = "web-server1"
  }
}

resource "aws_instance" "server2" {
  ami                         = "ami-0522ab6e1ddcc7055"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-subnet2.id
  vpc_security_group_ids      = [aws_security_group.sg-2.id]
  associate_public_ip_address = true

  user_data = <<-EOF
            #!/bin/bash
            sudo apt install nginx -y
            sudo systemctl start nginx
            EOF

  tags = {
    Name = "web-server2"
  }
}

