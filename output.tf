output "ec2_instance_public_id" {
  value = aws_instance.testInstance.public_ip
  #   sensitive = true
}

output "ubuntu_ami_id" {
  value     = data.aws_ami.ubuntu.id
  sensitive = false
}