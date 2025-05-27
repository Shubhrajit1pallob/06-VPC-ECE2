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
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"

  tags = {
    ManagedBy   = "Terraform"
    Name        = "main-subnet-public"
    Project     = "06-Resources"
    Environment = "Development"
    Owner       = "Shubhrajit Pallob"
  }
}

