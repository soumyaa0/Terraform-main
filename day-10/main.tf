

module "devops" {
    source = "github.com/soumyaa0/Terraform-main/day-02-basic_ec2"
    ami = "ami-0453ec754f44f9a4a"
    instance_type ="t2.micro"
    key_name = "devops"
}