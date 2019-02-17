provider "aws" {
  region = "eu-west-1"

variable "aws_access_key" {
   default = "AKIAIQJZ6IAOIWQTZIPA"
   description = "the user aws access key"
}
variable "aws_secret_key" {
    default = "4AsQFZyWHMSZzrtlX9cpQOMQawicikljGsoda+r6"
    description = "the user aws secret key"
  }
}

data "aws_ami" "rhel" {
  most_recent = true
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0e12cbde3e77cbb98"
  instance_type = "t2.micro"
  key_name = "Ansible"
  security_groups = [
        "default"
    ]

  tags {
    Name = "rhel"
  }
}
