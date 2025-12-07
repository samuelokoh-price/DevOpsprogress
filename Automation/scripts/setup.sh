#!/bin/bash

KEY_PATH=/home/samuel-okoh/Downloads/ec2-key-pair.pem


set -e

echo "starting full automation pipeline"

# Step 1: provision infrastructure with terraform
echo " Running terraform to provision infrastructure"
cd Automation/terraform
terraform init
terraform apply -auto-approve

#capture Ip/dns output while still in terraform directory
EC2_IP=$(terraform output -raw public_ip)
echo "EC2 public IP: $EC2_IP"
EC2_DNS=$(terraform output -raw public_dns)
echo "EC2 public DNS: $EC2_DNS"
echo "infrastructure provisioned"

# Step 2: configure servers with ansible
echo " Running ansible"
cd ../ansible
ansible-playbook -i inventory.ini playbook.yml
echo "automation pipeline complete"

# Step 3: Verify monitoring stack
echo "verifying monitoring containers"
echo "Connecting to EC2 at $EC2_IP"
ssh -i $KEY_PATH -o StrictHostKeyChecking=no ubuntu@$EC2_IP "sudo docker ps"
echo "monitoring stack is up and running"

echo "full automation pipeline finished successfully"
echo "Grafana dashboard is available at http://$EC2_IP:3000"
echo "Grafana dashboard username: admin"
echo "Grafana dashboard password: admin"
echo "Prometheus is available at http://$EC2_IP:9090"
