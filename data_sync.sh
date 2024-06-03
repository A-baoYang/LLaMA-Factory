# upload
aws s3 cp saves/ s3://llama-factory/saves/ --recursive
aws s3 cp data/dcardwom/ s3://llama-factory/data/dcardwom/ --recursive
aws s3 cp data/review3c_qa/ s3://llama-factory/data/review3c_qa/ --recursive

# download
aws s3 cp s3://llama-factory/saves/ saves/ --recursive
aws s3 cp s3://llama-factory/data/dcardwom/ data/dcardwom/ --recursive
aws s3 cp s3://llama-factory/data/dcardwom/ data/dcardwom/ --recursive
