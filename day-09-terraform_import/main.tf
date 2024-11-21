resource "aws_instance" "server" {
    ami = "ami-0aebec83a182ea7ea"
    instance_type = "t2.medium"

    tags = {
      Name="ec2"
    }
  
}

resource "aws_s3_bucket" "devops" {
    bucket = "importbuckett"
  
}