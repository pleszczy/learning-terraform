variable "vpc_val" {
  type = bool
}

variable "region" {
  type = string
}

variable "instance_type" {
  default     = "t2.micro"
  type        = string
  description = "The ec2 instance type e.g. t2.micro"
}

variable "ami" {
  type = string

  validation {
    condition = length(var.ami) > 4 && substr(var.ami, 0.4) == "ami-"
    error_message = "The ami id must be valid"
  }
}