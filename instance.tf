resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  count             = length(var.subnet_cidr)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.subnet_cidr, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "Subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "public_routing" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }
}

resource "aws_route_table_association" "routing_table_association" {
  subnet_id      = aws_subnet.public.0.id
  route_table_id = aws_route_table.public_routing.id
}