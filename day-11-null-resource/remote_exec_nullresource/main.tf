provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0453ec754f44f9a4a" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  key_name      = aws_key_pair.devops.key_name
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "ExampleInstance"
  }
}

resource "aws_security_group" "allow_ssh" {
  name_prefix = "allow_ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "devops" {
  key_name   = "devopsss"
  public_key = file("~/.ssh/id_ed25519.pub") # Path to your public key
}

resource "null_resource" "install_apache" {
  depends_on = [aws_instance.example]
 
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_ed25519") # Path to your private key
      host        = aws_instance.example.public_ip
    }

    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd"
    ]
  }
}