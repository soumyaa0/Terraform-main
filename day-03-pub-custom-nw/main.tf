#Create a vpc........!!
resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"

    tags = {
      Name="dev_vpc"
    }
}

#Create subnets.....!!
resource "aws_subnet" "dev_sub" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.0.0/24"

    tags = {
      Name="dev_subnet"
    }
  
}

#Create Internet gateway attach to vpc...!!
resource "aws_internet_gateway" "dev_ig" {
    vpc_id = aws_vpc.dev.id

     tags = {
       Name="dev_ig"
    }
}

#Create a route table edit routes..!!
resource "aws_route_table" "dev_rt" {
    vpc_id = aws_vpc.dev.id

    tags = {
      Name="rt"
    }

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev_ig.id
    }
}

#Subnet association...!!
resource "aws_route_table_association" "dev_route" {
  subnet_id = aws_subnet.dev_sub.id
  route_table_id = aws_route_table.dev_rt.id
  
}
#Create security group..!!
resource "aws_security_group" "allow_traffic" {
    name    = "allow_traffic"
    vpc_id  = aws_vpc.dev.id

    tags = {
      Name = "dev_sg"
    }
    ingress {
       description  = "traffic"
       from_port    = 80
       to_port      = 80
       protocol     = "tcp"
       cidr_blocks  = ["0.0.0.0/0"]

    }
    ingress {
        description = "traffic"
        from_port   = 22
        to_port     = 22
        protocol    = "TCP" 
        cidr_blocks = ["0.0.0.0/0"]

    }
    egress {
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

  
}
