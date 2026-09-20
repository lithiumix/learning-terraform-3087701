data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["aws-elasticbeanstalk-amzn-2023.12.20260831.64bit-eb_tomcat11corretto17_amazon_linux_2023-hvm-2026-09-09T01-41-48.770Z"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["732788773938"] # aws
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instance_type

  tags = {
    Name = "HelloWorld"
  }
}
