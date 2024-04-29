resource "aws_instance" "testInstance" {
  ami           = var.ami
  instance_type = var.instance_type
}

resource "aws_instance" "testInstanceX4" {
  count         = 4
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "Server ${count.index}"
  }
}


resource "aws_eip" "lb" {
  instance = aws_instance.testInstance.id
  vpc      = true
}