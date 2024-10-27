variable "region_name" {
  default = "us-east-1"
  type = string
  description = "Region name we are pointing our code"
}
variable "key_name" {
  default = "ec2.key1"
  type = string
  description = "Key name for the ec2 instance"
}