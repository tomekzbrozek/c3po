resource "aws_lambda_function" "iex_api_lambda" {
  function_name = "IexApiLast"

  handler = "iex_api_last.handler"
  runtime = "python3.7"

  role = "${var.TOMEK_AWS_ARN}"

  filename = "iex_api_last.zip"
}

# IAM role which dictates what other AWS services the Lambda function
# may access.
resource "aws_iam_role" "iex_api_lambda_role" {
  name = "IexApiLambdaRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution_role" {
  role       = "${aws_iam_role.iex_api_lambda_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
