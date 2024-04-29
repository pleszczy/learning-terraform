variable "vpc_cidr" {
  type = string
}

variable "subnet_cidr" {
  type = list(string)
}


variable "vpc_val" {
  type = bool
}

variable "vpc_name" {
  default = ""
  type    = string
}

variable "azs" {
  type = list(string)
}

variable "region" {
  type = string
}

variable "instance_type" {
  type        = string
  description = "The ec2 instance type e.g. t2.micro"
}

variable "ami" {
  type = string

  validation {
    condition     = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
    error_message = "The ami id must be valid"
  }
}