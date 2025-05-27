resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    ManagedBy   = "Terraform"
    Name        = "main-vpc"
    Project     = "06-Resources"
    Environment = "Development"
    Owner       = "Shubhrajit Pallob"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    ManagedBy   = "Terraform"
    Name        = "main-subnet-public"
    Project     = "06-Resources"
    Environment = "Development"
    Owner       = "Shubhrajit Pallob"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    ManagedBy   = "Terraform"
    Name        = "06-internet-gateway"
    Project     = "06-Resources"
    Environment = "Development"
    Owner       = "Shubhrajit Pallob"
  }
}


resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    ManagedBy   = "Terraform"
    Name        = "06-route-table"
    Project     = "06-Resources"
    Environment = "Development"
    Owner       = "Shubhrajit Pallob"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.main.id
}