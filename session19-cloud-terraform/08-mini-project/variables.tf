variable "aws_region" {
  description = "AWS region for the Session 19 mini project."
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "Small EC2 instance type used for the short-lived demo."
  type        = string
  default     = "t3.micro"
}

variable "bucket_name" {
  description = "Globally unique name for the private project S3 bucket."
  type        = string
}
