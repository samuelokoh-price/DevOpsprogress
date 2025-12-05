#defining the actual values for the terraform variables

#the region to deploy resources in
aws_region = "eu-north-1"

#the size of the Ec2 instance
instance_type = "t3.micro"

#your actual of the key pair name. Make sure this key pair already exists in your aws account 
key_name = "ec2-key-pair"

#the allowed cidr block range to access the instance and monitoring
allowed_cidr = "0.0.0.0/0"