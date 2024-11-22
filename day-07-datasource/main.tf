#Using this datasource process we can called existing resources to create a server..!!


data "aws_ami" "amzlinux" {          #Data block for called ami using this fillter process..!!
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}



data "aws_subnet" "devops" {    
    filter {
      name = "tag:Name"
      values = ["dev_subnet"]   #Insert subnet value here..!!!
    }

  
}


resource "aws_instance" "dev" {
    ami = "ami-0aebec83a182ea7ea"
    instance_type = "t2.micro"
    key_name = "projectK"
    subnet_id = data.aws_subnet.devops.id
  
}