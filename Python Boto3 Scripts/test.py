import boto3
client = boto3.client('s3')

# to upload a file to S3
client.upload_file('/tmp/hello.txt', 'amzn-s3-demo-bucket', 'hello.txt')

# to download a file from S3
client.download_file('amzn-s3-demo-bucket', 'hello.txt', '/tmp/hello.txt')

# to list all the bucket in S3 region us-east-1
response = client.list_buckets(
    MaxBuckets=123,
    BucketRegion='us-east-1'
)
print(response)

# to delete an object in S3
response = client.delete_object(
    Bucket='amzn-s3-demo-bucket',
    Key='/tmp/hello.txt'
)
print(response)

# copy an object from source to dest Bucket
copy_source = {
    'Bucket': 'amzn-s3-demo-bucket-2',
    'Key': 'hello.txt'
}
response = client.copy_object(
    ACL='private'|'public-read'|'public-read-write'|'authenticated-read'|'aws-exec-read'|'bucket-owner-read'|'bucket-owner-full-control',
    Bucket='amzn-s3-demo-bucket',
    CopySource=copy_source,
    Key='hello_copy.txt',
)
print(response)