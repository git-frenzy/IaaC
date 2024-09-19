resource "aws_instance" "server" {
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"

  tags = {
    Name = "tf-server"
  }
}
