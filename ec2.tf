
resource "aws_instance" "testInstance" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  availability_zone           = var.azs.1
  subnet_id                   = aws_subnet.public.1.id
  associate_public_ip_address = true
}

resource "aws_instance" "testInstanceX4" {
  count         = 4
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = "Server ${count.index}"
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.testInstance.id
  vpc      = true
}

output "ec2_instance_public_id" {
  value     = aws_instance.testInstance.public_ip
  sensitive = true
}