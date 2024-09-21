import json
import boto3

def handler(event, context):
    s3 = boto3.client('s3')

    bucket_name = event['detail']['requestParameters']['bucketName']

    try:
        bucket_tagging = s3.get_bucket_tagging(Bucket=bucket_name)
        tags = {tag['Key']: tag['Value'] for tag in bucket_tagging['TagSet']}

        if tags.get('public') != 'true':
            print(f"Making bucket {bucket_name} private.")
            s3.put_bucket_acl(Bucket=bucket_name, ACL='private')
        else:
            print(f"Bucket {bucket_name} is public.")
    except Exception as e:
        print(f"Error processing bucket {bucket_name}: {str(e)}")
