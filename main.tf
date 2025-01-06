# Criação do banco de dados PostgreSQL na AWS
resource "aws_db_instance" "postgres" {
  allocated_storage    = var.db_allocated_storage
  engine               = "postgres"
  engine_version       = "14.15"  # Versão suportada pela AWS
  instance_class       = var.db_instance_class
  db_name              = var.db_name
  username             = "masteruser"  # Alterado para evitar palavras reservadas
  password             = "Proteu690201"  # Senha fixa do banco
  publicly_accessible  = true
  db_subnet_group_name = aws_db_subnet_group.example.name  # Associa o grupo de subnets ao RDS
  skip_final_snapshot  = true

  tags = {
    Name = "example-postgres-db"
  }
}

# Criação de uma VPC
resource "aws_vpc" "example" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "example-vpc"
  }
}

# Criação de um Internet Gateway
resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id
  tags = {
    Name = "example-igw"
  }
}

# Criação de uma rota padrão para o Internet Gateway
resource "aws_route" "default_route" {
  route_table_id         = aws_vpc.example.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.example.id
}

# Criação de Subnets
resource "aws_subnet" "example_subnet_1" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "example-subnet-1"
  }
}

resource "aws_subnet" "example_subnet_2" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "example-subnet-2"
  }
}

# Criação de um Subnet Group para o RDS
resource "aws_db_subnet_group" "example" {
  name       = "example-db-subnet-group"
  subnet_ids = [aws_subnet.example_subnet_1.id, aws_subnet.example_subnet_2.id]
  tags = {
    Name = "example-db-subnet-group"
  }
}
