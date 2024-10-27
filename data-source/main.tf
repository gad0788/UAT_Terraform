

resource "aws_instance" "demo" {
  ami           = data.aws_instance.ec21.ami
  instance_type = data.aws_instance.ec21.instance_type
  key_name      = data.aws_instance.ec21.key_name
  subnet_id     = data.aws_instance.ec21.subnet_id 
}

resource "aws_instance"" "demo2"{
  ami = data.aws_ami.ami1.id
  instance_type = data.aws_instance.ec21.instance_type
  key_name = data.aws_instance.ec21.key_name
}
