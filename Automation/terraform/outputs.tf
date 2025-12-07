# Telling Terraform what information to print out after it provisions your EC2 instance.

#show the public IP address of the instance
output "public_ip" {
  description = "The public IP address of the monitoring server"
    value       = aws_instance.monitoring.public_ip
}

#show the public DNS of the instance
output "public_dns" {
  description = "The public DNS of the monitoring server"
  value       = aws_instance.monitoring.public_dns
}

# Show the public ID of the instance
output "public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.my_ec2.public_ip
}