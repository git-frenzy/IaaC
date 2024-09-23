resource "aws_vpc" "vpc-1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-1"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-1.id

  tags = {
    Name = "igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc-1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public-sub1" {
  route_table_id = aws_route_table.rt.id
  subnet_id      = aws_subnet.public-subnet1.id
}

resource "aws_route_table_association" "public-sub2" {
  route_table_id = aws_route_table.rt.id
  subnet_id      = aws_subnet.public-subnet2.id
}
