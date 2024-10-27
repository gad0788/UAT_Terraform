# Referencing resources that was created outside of terraform and want ami, key, any data about that resource
data "aws_instance" "ec21" {
  instance_id = "i-0c60fb0f513998d9e"
}
# data "aws_vpc" "vpc_demo"{
# vpc_id = "vpc-0f813a6d00cba6306"
# }

