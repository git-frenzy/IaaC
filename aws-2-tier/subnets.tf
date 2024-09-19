resource "aws_subnet" "public-subnet1" {
  vpc_id            = aws_vpc.vpc-1.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "public-subnet1"
    Name = "web-server1"
  }
}

resource "aws_subnet" "private-subnet1" {
  vpc_id            = aws_vpc.vpc-1.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "private-subnet1"
    Name = "web-server1"
  }

}


resource "aws_subnet" "public-subnet2" {
  vpc_id            = aws_vpc.vpc-1.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "public-subnet2"
    Name = "web-server2"
  }
}

resource "aws_subnet" "private-subnet2" {
  vpc_id            = aws_vpc.vpc-1.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "private-subnet2"
    Name = "web-server2"
  }

}
