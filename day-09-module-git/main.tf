module "ec2-git" {
    source = "github.com/soumyaa0/Terraform-main/day-02-basic_ec2"
    ami= var.ami
    instance_type = var.instance_type
    key_name = var.key_name
}