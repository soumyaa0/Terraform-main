resource "aws_instance" "dependent" {
    ami = "ami-0453ec754f44f9a4a"
    instance_type = "t2.micro"
    key_name = "devops"  
}

resource "aws_s3_bucket" "dependent" {
    bucket = "soumyahost" 
}


#terraform apply -target=aws_s3_bucket.dependent
#terraform destroy -target=aws_s3_bucket.dependent