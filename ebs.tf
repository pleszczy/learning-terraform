resource "aws_ebs_volume" "ebs" {
  availability_zone = var.azs.1
  size              = 5
}

resource "aws_volume_attachment" "ebs-attach" {
  device_name = "/dev/sdd"
  instance_id = aws_instance.testInstance.id
  volume_id   = aws_ebs_volume.ebs.id
}