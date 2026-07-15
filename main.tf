data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "product-code"
    values = ["987bswk7m5oqlg9x85e6p8mvl"] # Unique product code for Bitnami Tomcat Stack
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners      = ["aws-marketplace"] # Searches the whole marketplace catalog
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t3.nano"

  tags = {
    Name = "HelloWorld"
  }
}
