variable "aws_region" {
  description = "Aws region to deploy resources in"
  type        = string
  default     = "eu-west-2" # You can change this if you want to use a specific profile
}

variable "vpc_cidr" {
description = "The CIDR block for the VPC"
type = string
default = "10.0.0.0/16"
}

variable "aws_instance_tenancy" {
description = "instance_tenancy to use for tenacity_vpc"
type = string
default = "default"
}