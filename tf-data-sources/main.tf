data "aws_ami" "name" {
  most_recent = true
  owners      = ["amazon"]

}

output "ami" {
  value = data.aws_ami.name.id

}

data "aws_security_group" "sg" {
  tags = {
    Name = "sg-1"
  }
}

output "sg-id" {
  value = data.aws_security_group.sg.id
}


data "aws_vpc" "vpc" {
  tags = {
    Name = "vpc-1"
  }
}

output "vpc-id" {
  value = data.aws_vpc.vpc.id
}

# resource "aws_instance" "tf-server" {
#   ami           = "ami-0522ab6e1ddcc7055"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "tf-server"
#   }
# }

