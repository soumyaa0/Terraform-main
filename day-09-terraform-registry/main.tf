module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = var.type
  key_name               = var.key
  monitoring             = true
  subnet_id              = "subnet-0732ce4bd75e2ba0b"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}