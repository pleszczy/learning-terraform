resource "aws_ebs_volume" "ebs-b" {
  availability_zone = var.azs.1
  size              = 10
}

resource "aws_ebs_volume" "ebs-a" {
  availability_zone = var.azs.0
  size              = 10
}

resource "aws_volume_attachment" "ebs-a-attach" {
  device_name = "/dev/sdb"
  instance_id = aws_instance.testInstance.id
  volume_id   = aws_ebs_volume.ebs-a.id
}

resource "aws_volume_attachment" "ebs-b-attach" {
  device_name = "/dev/sdc"
  instance_id = aws_instance.testInstance.id
  volume_id   = aws_ebs_volume.ebs-b.id
}