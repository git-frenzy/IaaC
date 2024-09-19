#VPC

resource "aws_vpc" "vpc-1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "test-vpc"
  }
}


#Private Subnet

resource "aws_subnet" "private-subnet-1" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.vpc-1.id
  tags = {
    Name = "private-test-subnet"
  }
}


#Public Subnet

resource "aws_subnet" "public-subnet-1" {
  cidr_block              = "10.0.2.0/24"
  vpc_id                  = aws_vpc.vpc-1.id
  map_public_ip_on_launch = true
  tags = {
    Name = "public-test-subnet"
  }
}


#IGW

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-1.id
  tags = {
    Name = "test-igw"
  }
}


#Route Table

resource "aws_route_table" "rt" {

  vpc_id = aws_vpc.vpc-1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}


#Routing Table Associations

resource "aws_route_table_association" "public-sub" {

  route_table_id = aws_route_table.rt.id
  subnet_id      = aws_subnet.public-subnet-1.id
}


#EC2

resource "aws_instance" "tf-server" {
  ami           = "ami-0182f373e66f89c85"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public-subnet-1.id

  tags = {
    Name = "tf-server"
  }
}


resource "aws_security_group" "sg-1" {
  vpc_id = aws_vpc.vpc-1.id
  name   = "allows_http"

  # Inbound
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow traffic from anywhere
  }

  # Outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"] # Allow traffic to anywhere
  }
}
