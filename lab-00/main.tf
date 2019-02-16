provider "aws" {
  region = "eu-west-1"

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
  security_groups = [
        "default
    ]

  tags {
    Name = "rhel"
  }
}