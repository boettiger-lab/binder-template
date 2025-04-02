
BUCKET=espm-288 

aws s3api --endpoint-url http://${AWS_S3_ENDPOINT} put-bucket-cors --bucket ${BUCKET} --cors-configuration '{
  "CORSRules": [
    {
      "AllowedOrigins": ["*"],
      "AllowedMethods": ["GET"],
      "ExposeHeaders": ["ETag", "Content-Type", "Content-Disposition"],
      "AllowedHeaders": ["*"]
    }
  ]
}'


# test
# aws s3api --endpoint-url http://${AWS_S3_ENDPOINT} get-bucket-cors --bucket ${BUCKET}