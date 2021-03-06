resource "aws_cloudwatch_log_group" "iex_api_lambda_cw" {
  name              = "/aws/lambda/iex_api_lambda_cw"
  retention_in_days = 3
}

# See also the following AWS managed policy: AWSLambdaBasicExecutionRole
resource "aws_iam_policy" "lambda_logging" {
  name = "lambda_logging"
  path = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = "${aws_iam_role.iex_api_lambda_role.name}"
  policy_arn = "${aws_iam_policy.lambda_logging.arn}"
}

resource "aws_cloudwatch_event_rule" "trigger" {
  name                = "IEX-API-Lambda-trigger"
  description         = "Download IEX API Last data"
  schedule_expression = "cron(0 4 * * ? *)"
}

resource "aws_cloudwatch_event_target" "iex_api_lambda_trigger" {
  rule = "${aws_cloudwatch_event_rule.trigger.name}"
  target_id = "iex_api_lambda"
  arn  = "${aws_lambda_function.iex_api_lambda.arn}"
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_iex_api_lambda" {
    statement_id = "AllowExecutionFromCloudWatch"
    action = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.iex_api_lambda.function_name}"
    principal = "events.amazonaws.com"
    source_arn = "${aws_cloudwatch_event_rule.trigger.arn}"
}
