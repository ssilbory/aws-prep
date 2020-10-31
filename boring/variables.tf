variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-west-2"
}

# Ubuntu Precise 12.04 LTS (x64)
variable "aws_amis" {
  default = {
    us-east-1 = "ami-0739f8cdb239fe9ae"
    us-east-2 = "ami-0ebc8f6f580a04647"
    us-west-1 = "ami-08d0eee5e00da8a9b"
    us-west-2 = "ami-008b09448b998a562"
  }
}
