resource "aws_instance" "testInstance" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  availability_zone           = var.azs.1
  subnet_id                   = aws_subnet.public.1.id
  associate_public_ip_address = true
}

# resource "aws_instance" "testInstanceX4" {
#   count         = 4
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.instance_type
#
#   tags = {
#     Name = "Server ${count.index}"
#   }
# }

resource "aws_eip" "lb" {
  instance = aws_instance.testInstance.id
  vpc      = true
}

# Just an example of using the ec2 instance module
# module "ec2-instance" {
#   source = "terraform-aws-modules/ec2-instance/aws"
#
#   ami = data.aws_ami.ubuntu.id
#   associate_public_ip_address = true
#   instance_type = var.instance_type
#   ipv6_address_count = 0
#   ipv6_addresses = []
#   name = "testing-ec2-module-use"
#   count = 1
#   private_ip = ""
#   user_data = ""
#   vpc_security_group_ids = ["sg-73dc7533"]
#   subnet_id = "subenet-0bcedd72"
# }