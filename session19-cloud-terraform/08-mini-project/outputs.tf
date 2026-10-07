output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "subnet_id" {
  value = aws_subnet.public.id
}

output "security_group_id" {
  value = aws_security_group.web.id
}

output "instance_id" {
  description = "ID of the EC2 web server."
  value       = aws_instance.web.id
}

output "instance_public_ip" {
  description = "Public IPv4 address assigned to the web server."
  value       = aws_instance.web.public_ip
}

output "web_url" {
  description = "HTTP URL served by the EC2 instance."
  value       = "http://${aws_instance.web.public_dns}"
}

output "bucket_name" {
  description = "Name of the private S3 bucket."
  value       = aws_s3_bucket.project.bucket
}

output "bucket_arn" {
  description = "ARN of the private S3 bucket."
  value       = aws_s3_bucket.project.arn
}
