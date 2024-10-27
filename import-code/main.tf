# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_instance" "web" {
  ami                                  = "ami-0ddc798b3f1a5117e"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1d"
  instance_type                        = "t2.micro"
  key_name                             = "ec2-key"
  security_groups                      = ["launch-wizard-6"]
  subnet_id                            = "subnet-09a11a2782dee2513"
  tags = {
    Name = "webserver"
  }
  tags_all = {
    Name = "Created bt Terraform"
  }
}
