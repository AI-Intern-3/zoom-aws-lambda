## Step 1: Test Your Lambda Function

### Invoking the Lambda Function

1. **Navigate to Lambda Function:** In the AWS Management Console, go to the Lambda service and select your function.
2. **Test Tab:** Click on the "Test" tab.
3. **Create Test Event:**
   * Click on "Create new event".
   * Provide a name for the test event (e.g., "download_and_upload").
   * In the event template, create a JSON object with the following structure:
     ```json
     {
         "download_url": "https://example.com/video.mp4",
         "file_name": "video.mp4"
     }
     ```
   * Replace the placeholder values with actual download URL and desired filename.
4. **Invoke Function:** Click on the "Test" button to invoke the Lambda function with the provided event.

### Checking S3 Bucket

1. **Navigate to S3:** In the AWS Management Console, go to the S3 service.
2. **Open Your Bucket:** Open the S3 bucket where you expect the video to be uploaded.
3. **Verify File Upload:** Check if the file with the specified filename is present in the bucket.

**Additional Tips:**
* **Log Inspection:** Check the Lambda function logs for any errors or exceptions during execution.
* **Error Handling:** Implement proper error handling in your Lambda function to provide informative messages in case of failures.
* **Test Different Scenarios:** Test your function with different file sizes, download URLs, and error conditions to ensure robustness.

By following these steps, you can effectively test your Lambda function and verify its functionality.
 
**Would you like to proceed to the next step of optimizing your Lambda function?**
