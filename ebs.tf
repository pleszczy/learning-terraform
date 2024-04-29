resource "aws_ebs_volume" "ebs-b" {
  availability_zone = var.azs.1
  size              = 10
}

resource "aws_ebs_volume" "ebs-a" {
  availability_zone = var.azs.0
  size              = 10
}

resource "aws_volume_attachment" "ebs-a-attach" {
  device_name = "ebs-a"
  instance_id = aws_instance.testInstance
  volume_id   = aws_ebs_volume.ebs-a
}

resource "aws_volume_attachment" "ebs-b-attach" {
  device_name = "ebs-b"
  instance_id = aws_instance.testInstance
  volume_id   = aws_ebs_volume.ebs-b
}