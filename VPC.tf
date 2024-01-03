/*resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "Custom_VPC"
  }
}

resource "aws_subnet" "Public_Subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

 tags = {
    Name = "Public Subnet-TF"
  }
}

resource "aws_subnet" "Private_Subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

 tags = {
    Name = "Private Subnet-TF"
  }
}

resource "aws_internet_gateway" "Internet_Gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "IGW-TF"
  }
}

# Create a public route table
resource "aws_route_table" "Public_route_table" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Public_RT"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.Public_Subnet.id
  route_table_id = aws_route_table.Public_route_table.id
}

resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.Private_Subnet.id
  route_table_id = aws_route_table.Private_route_table.id
}

# Create a private route table
resource "aws_route_table" "Private_route_table" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Private_RT"
  }
}

resource "aws_eip" "nat_eip" {
}


resource "aws_nat_gateway" "NAT_GW" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.Public_Subnet.id
  connectivity_type = "public"

  tags = {
    Name = "Custom_NAT_GW"
  }
}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.Private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id          = aws_nat_gateway.NAT_GW.id
}










output "NAT_GW_ID"{
    value = aws_eip.nat_eip.id
    
}



output "Public_route_table_ID"{
    value = aws_route_table.Public_route_table.id
    
}
output "Private_route_table_ID"{
    value = aws_route_table.Private_route_table.id
    
}
output "VPC_ID" {
  value = aws_vpc.main.id
}
output "IGW_ID" {
  value = aws_internet_gateway.Internet_Gateway.id 
}*/