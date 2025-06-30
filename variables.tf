variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type (e.g., t2.micro)"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The SSH key pair name"
  type        = string
}

variable "stage" {
  description = "Deployment stage: Dev or Prod"
  type        = string
}
