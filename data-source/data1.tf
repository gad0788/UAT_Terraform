data "aws_ami" "ami1" {
  executable_users = ["self"]
  most_recent      = true
 
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*-x86_64-ebs"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
resource "aws_instance" "server" {
  ami = data.aws_ami.ami1.id
}