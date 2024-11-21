#Create a vpc........!!
resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"

    tags = {
      Name="main_vpc"
    }
}

#Create subnets.....!!
resource "aws_subnet" "dev_sub01" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.0.0/24"

    tags = {
      Name="pub_subnet"
    }
  
}

resource "aws_subnet" "dev_sub02" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.1.0/24"

    tags = {
      Name="prvt_subnet"
    }
  
}

#Create Internet gateway attach to vpc...!!
resource "aws_internet_gateway" "dev_ig" {
    vpc_id = aws_vpc.dev.id

     tags = {
       Name="dev_ig"
    }
}
resource "aws_eip" "dev_eip" {
  
}

resource "aws_nat_gateway" "dev_nat" {
    allocation_id = aws_eip.dev_eip.id
    subnet_id = aws_subnet.dev_sub01.id
  
}

#Create a route table edit routes..!!
resource "aws_route_table" "pub_rt" {
    vpc_id = aws_vpc.dev.id

    tags = {
      Name="pub_rt"
    }

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev_ig.id
    }
}
resource "aws_route_table" "prvt_rt" {
    vpc_id = aws_vpc.dev.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.dev_nat.id
    }
  
  tags = {
    Name="prvt_rt"
  }
}
#Subnet association...!!
resource "aws_route_table_association" "dev_route" {
  subnet_id = aws_subnet.dev_sub01.id
  route_table_id = aws_route_table.pub_rt.id
  
}

resource "aws_route_table_association" "dev_rt" {
  subnet_id = aws_subnet.dev_sub02.id
  route_table_id = aws_route_table.prvt_rt.id
  
}

#Create security group..!!
resource "aws_security_group" "allow_traffic" {
    name    = "allow_traffic"
    vpc_id  = aws_vpc.dev.id

    tags = {
      Name = "dev_sg"
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

resource "aws_instance" "pub-server" {
    ami = "ami-0aebec83a182ea7ea"
    instance_type = "t3.medium"
    key_name = "projectK"

    subnet_id = aws_subnet.dev_sub01.id
    associate_public_ip_address = true
    security_groups = [ aws_security_group.allow_traffic.id ]

    tags = {
        Name="pub_01"
    }
}

resource "aws_instance" "prvt-server" {
    ami = "ami-0aebec83a182ea7ea"
    instance_type = "t3.medium"
    key_name = "projectK"
    security_groups = [ aws_security_group.allow_traffic.id ]
    subnet_id = aws_subnet.dev_sub02.id

    tags = {
        Name="prvt_01"
    }
}
