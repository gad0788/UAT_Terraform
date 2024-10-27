/*
resource "aws_iam_group" "DevOps" {
  name = "DevOps_Team"
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_iam_user" "user1" {
  name = "petit_2010"
  depends_on = [ aws_iam_group.DevOps ]
}
*/
resource "aws_instance" "server1" {
  ami = "ami-0ddc798b3f1a5117e"
  instance_type = "t3.small"
  key_name = "ec2-key"
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    name = "server1"
 
}
}