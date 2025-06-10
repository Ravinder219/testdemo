#!/bin/bash

# Define Variables
AMI_ID="ami-004ba7be325bcfd49"  # Retrieved from your screenshot
INSTANCE_TYPE="t2.micro"         # Change as needed
KEY_NAME="MyKeyPair"             # Replace with your Key Pair name
SECURITY_GROUP_ID="sg-903004f8"  # Your security group
SUBNET_ID="subnet-6e7f829e"      # Your subnet
TAG_NAME="MyEC2Instance"

# Create EC2 Instance
INSTANCE_ID=$(aws ec2 run-instances \
    --image-id $AMI_ID \
    --count 1 \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-group-ids $SECURITY_GROUP_ID \
    --subnet-id $SUBNET_ID \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$TAG_NAME}]" \
    --query 'Instances[0].InstanceId' \
    --output text)

echo "EC2 Instance $INSTANCE_ID is being created..."
