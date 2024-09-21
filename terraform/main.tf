provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

resource "aws_lambda_function" "s3_bucket_policy_checker" {
  function_name = "s3_bucket_policy_checker"
  runtime       = "python3.10"
  handler       = "lambda_function.handler"
  role          = aws_iam_role.lambda_exec.arn
  source_code_hash = filebase64sha256("lambda_function.zip")
  filename      = "lambda_function.zip"
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect = "Allow"
        Sid = ""
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "lambda_logging" {
  name       = "lambda-logging"
  roles      = [aws_iam_role.lambda_exec.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_policy" "s3_bucket_policy" {
  name = "s3_bucket_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListAllMyBuckets",
          "s3:GetBucketPolicy",
          "s3:PutBucketPolicy",
          "s3:GetBucketTagging"
        ]
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "lambda_s3_access" {
  name       = "lambda-s3-access"
  roles      = [aws_iam_role.lambda_exec.name]
  policy_arn = aws_iam_policy.s3_bucket_policy.arn
}

resource "aws_cloudwatch_event_rule" "s3_bucket_creation" {
  name = "s3_bucket_creation"
  event_pattern = jsonencode({
    source = ["aws.s3"]
    detail-type = ["AWS API Call via CloudTrail"]
    detail = {
      eventSource = ["s3.amazonaws.com"]
      eventName = ["CreateBucket"]
    }
  })
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule = aws_cloudwatch_event_rule.s3_bucket_creation.name
  arn  = aws_lambda_function.s3_bucket_policy_checker.arn
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.s3_bucket_policy_checker.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.s3_bucket_creation.arn
}
