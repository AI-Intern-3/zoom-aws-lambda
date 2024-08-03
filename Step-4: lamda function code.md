# Write the Lambda Function Code
Here’s a sample Python code for your Lambda function:
```
Import boto3
Import requests
Import os

# AWS and Zoom configuration
S3_BUCKET_NAME = ‘your-s3-bucket-name’
ZOOM_CLIENT_ID = os.environ[‘ZOOM_CLIENT_ID’]
ZOOM_CLIENT_SECRET = os.environ[‘ZOOM_CLIENT_SECRET’]
ZOOM_ACCOUNT_ID = os.environ[‘ZOOM_ACCOUNT_ID’]

# Create S3 client
S3_client = boto3.client(‘s3’)

Def get_zoom_oauth_token():
    Token_url = https://zoom.us/oauth/token
    Headers = {
        “Authorization”: f”Basic {ZOOM_CLIENT_ID}:{ZOOM_CLIENT_SECRET}”
    }
    Data = {
        “grant_type”: “account_credentials”,
        “account_id”: ZOOM_ACCOUNT_ID
    }
    Response = requests.post(token_url, headers=headers, data=data)
    Return response.json().get(‘access_token’)

Def download_zoom_video(download_url, file_name):
    Response = requests.get(download_url, stream=True)
    With open(file_name, ‘wb’) as f:
        For chunk in response.iter_content(chunk_size=8192):
            If chunk:
                f.write(chunk)
    return file_name

def upload_to_s3(file_name, bucket_name, s3_file_name):
    s3_client.upload_file(file_name, bucket_name, s3_file_name)

def lambda_handler(event, context):
    access_token = get_zoom_oauth_token()
    
    # Assuming `event` contains the download URL and file name
    Download_url = event[‘download_url’]
    File_name = event[‘file_name’]
    
    Downloaded_file = download_zoom_video(download_url, file_name)
    Upload_to_s3(downloaded_file, S3_BUCKET_NAME, file_name)

    # Cleanup
    Os.remove(downloaded_file)
    Return {
        “statusCode”: 200,
        “body”: “Video downloaded and uploaded to S3 successfully!”
    }
```
