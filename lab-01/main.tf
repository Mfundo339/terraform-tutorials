provider "aws" {
  region     = "us-west-1"
  access_key = "AKIAIQJZ6IAOIWQTZIPA"
  secret_key = "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"
}

resource "aws_instance" "web" {
  ami           = "ami-0e12cbde3e77cbb98"
  instance_type = "t2.micro"
  security_groups = [
        "default"
    ]
  key_name = "ansible"
  tags {
    Name = "rhel-jenkins"
  }
  provisioner "remote-exec" {
    inline = [
      "hostname -f"
    ]
    connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key  = "${file("~/ansible.pem")}"
  }
  }
  
   provisioner "local-exec" {
    command = "ansible-playbook -i ${aws_instance.web.public_ip}, install-jenkins.yml -b"
  }
}
