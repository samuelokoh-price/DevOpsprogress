#setting up variable for the AWS account profile

#variable for the aws region to deploy resources in
variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-north-1"
  
}

# the size of the Ec2 instance
variable "instance_type" {
  description = "The type of EC2 instance to use"
  type        = string
  default     = "t3.micro"
}

# name of your existing key pair to have ssh access to the instance
variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
  
}

# the allowed cidr block to access the instance and monitoring
variable "allowed_cidr" {
    description = "The CIDR block range allowed to access the instance & monitoring"
    type        = string
    default     = "0.0.0./0"
  
}