# Generated the secure key and encrypted to PEM format
resource "tls_private_key" "my_ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
# Create aws key pair component in aws
resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2.key1"
  public_key = tls_private_key.my_ec2_key.public_key_openssh
}
# Save my key pair file to current working directory
resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.ec2_key.key_name}.pem"
  content  = tls_private_key.my_ec2_key.private_key_pem
}
resource "aws_instance" "demo1" {
  ami           = "ami-0ddc798b3f1a5117e"
  instance_type = "t2.micro"
  key_name      = "ec2.key1" 
  tags = {
    Name = "demo1"
  }
#   provisioner "local-exec" {
#     command = "echo ${aws_instance.demo1.public_ip} >> public_ip.txt"
#   }
    # provisioner "remote-exec" {
    #   inline = [ 
    #   "sudo useradd peti2",
    #   "sudo yum install httpd -y",
    #   "sudo systemctl start httpd",
    #   "sudo systemctl enable httpd",
    #   "sudo echo 'welcome to my web server' | sudo tee /var/www/html/index.html",
    #   "sudo sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf",
    #   "sudo systemctl restart httpd"
    #   ]
    # }
    # provisioner "" {
      
    # }
    # provisioner "file" {
    #   source = "public_ip.txt"
    #   destination = "/home/ec2-user/public_ip.txt"
    # }
}
resource "null_resource" "n1" {
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file(local_file.ssh_key.filename)
    host = aws_instance.demo1.public_ip
  }
  provisioner "remote-exec" {
    inline = [ 
      "sudo useradd peti2",
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "sudo echo 'welcome to my web server' | sudo tee /var/www/html/index.html",
      "sudo sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf",
      "sudo systemctl restart httpd"
    ]
  }
  provisioner "file" {
    source = "public_ip.txt"
    destination = "/home/ec2-user/public_ip.txt"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.demo1.public_ip} >> public_ip.txt"
  } 
  depends_on = [
    aws_instance.demo1, local_file.ssh_key
  ]
  lifecycle {
    create_before_destroy = true
  }
}
