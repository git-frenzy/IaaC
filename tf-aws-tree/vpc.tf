resource "aws_vpc" "vpc-1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-1"
    Name = "test-server"
  }

}

resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public-subnet"
    Name = "test-server"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private-subnet"
    Name = "test-server"
  }



}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-1.id

  tags = {
    Name = "igw"
    Name = "test-server"
    
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc-1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public-sub" {
  route_table_id = aws_route_table.rt.id
  subnet_id      = aws_subnet.public-subnet.id
}
