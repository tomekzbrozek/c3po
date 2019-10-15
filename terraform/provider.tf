provider "aws" {
  version    = "~> 2.31"
  region     = "${var.TOMEK_AWS_REGION}"
  access_key = "${var.TOMEK_AWS_ACCESS_KEY_ID}"
  secret_key = "${var.TOMEK_AWS_SECRET_ACCESS_KEY}"
}
