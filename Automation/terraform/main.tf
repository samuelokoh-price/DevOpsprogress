#defining the resources (EC2 instance, security group, AMI) that Terraform will create

#Telling Terraform which version and provider to use
terraform {
  required_version = "1.14.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

# Configuring AWS provider with the region from variables.tf
provider "aws" {
  region = var.aws_region
}

#Creating a security group for monitoring tools (Grafana, Prometheus) and ssh access
resource "aws_security_group" "monitoring_sg" {
    name        = "monitoring-sg"
    description = "Security group for monitoring tools(Grafana, Prometheus) and allow ssh access"
    
    # defining ingress rules for ssh and monitoring tools

    #allow ssh access from the allowed cidr block
    ingress {
        description = "SSH access"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [var.allowed_cidr]
    }
    
    #allow acesss to grafana
    ingress {
        description = "Grafana access"
        from_port   = 3000
        to_port     = 3000
        protocol    = "tcp"
        cidr_blocks = [var.allowed_cidr]
    }
    #allow access to prometheus
    ingress {
        description = "Prometheus access"
        from_port   = 9090
        to_port     = 9090
        protocol    = "tcp"
        cidr_blocks = [var.allowed_cidr]
    }

    #allow access to node exporter
    ingress {
        description = "Node Exporter access"
        from_port   = 9100
        to_port     = 9100
        protocol    = "tcp"
        cidr_blocks = [var.allowed_cidr]
    }

    #defining egress rule to allow all outbound traffic
    egress {
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "monitoring-sg"
    }
    
}

#fetch the latest ubuntu 22.04 ami from aws
data "aws_ami" "ubuntu" {
    most_recent = true
    owners      = ["099720109477"] # Canonical

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    }
}

#Creating an EC2 instance with the specified instance type, key pair, and security group
resource "aws_instance" "monitoring" {
    ami                    = data.aws_ami.ubuntu.id
    instance_type          = var.instance_type
    key_name               = var.key_name
    vpc_security_group_ids = [aws_security_group.monitoring_sg.id]

    tags = {
        Name = "monitoring-instance"
    }

    # adding cloud-init script to install python (needed for ansible later)
    user_data = <<-EOF
                #!/bin/bash
                apt-get update -y
                apt-get install python3 -y python3-pip
                EOF

}