aws ec2 run-instances \
    --image-id ami-053b0d53c279acc90 \
    --instance-type t2.micro \
    --region us-east-1 \
    --count 1 \
    --key-name web01-dev-nvir \
    --block-device-mappings file://block-device-mappings.json \
    --tag-specifications \
        'ResourceType=instance,Tags=[{Key=Name,Value=web02}]' \
        'ResourceType=volume,Tags=[{Key=Name,Value=web02-disk1}]' \
    --security-group-ids sg-0f093d44a9a5a5df7 \
    --user-data file://my_script.sh