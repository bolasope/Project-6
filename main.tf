provider "aws" {
  region = "eu-west-2"
}

resource "aws_vpc" "main-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main-vpc"
  }
}

# public subnet
resource "aws_subnet" "subnet-public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-public"
  }
}

# private
resource "aws_subnet" "subnet-private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "subnet-private"
  }
}
