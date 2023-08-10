aws ec2 run-instances \
    --image-id ami-0df2a11dd1fe1f8e3 \
    --instance-type t2.micro \
    --region us-east-1 \
    --count 1 \
    --key-name web01-dev-nvir \
    --block-device-mappings file://block-device-mappings.json \
    --tag-specifications \
        'ResourceType=instance,Tags=[{Key=Name,Value=web01}]' \
        'ResourceType=volume,Tags=[{Key=Name,Value=web01-disk1}]' \
    --security-group-ids sg-0f093d44a9a5a5df7 \
    --user-data file://my_script.sh