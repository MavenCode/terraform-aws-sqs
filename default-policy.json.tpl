{
    "Version": "2012-10-17",
    "Id": "sqspolicy",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": "*",
        "Action": "sqs:*",
        "Resource": "arn:aws:sqs:*:*:s3-event-queue",
        "Condition": {
            "ArnEquals": { "aws:SourceArn": "${bucket_arn}" }
        }
      }
    ]
}
