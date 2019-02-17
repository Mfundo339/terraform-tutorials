variable "AWS-access-KEY" {}
variable "AWS_SECRET_KEY" {}

provider "aws" {
  region = "eu-west-1"
  access_key = "${var.AWS_ACCESS_KEY}"
  secret_key = "${var.AWS_SECRET_KEY}"
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
        "default
    ]

  tags {
    Name = "rhel"
  }
}
