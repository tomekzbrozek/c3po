C3PO uses [IEX Trading](https://iextrading.com/developer/) data to collect historical prices of stocks traded on NYSE and NASDAQ on schedule and save in AWS S3.

# To Do:

* add a step that removes all packages from `lambda/` before downloading packages
* add cloudwatch schedule
* add logging
* deploy a service on AWS Batch or EC2 that runs historical data population for IEX API (https://medium.com/better-programming/cron-job-patterns-in-aws-126fbf54a276)

# Arch / to read:

* Deployment package! I.e. how to install library: https://docs.aws.amazon.com/lambda/latest/dg/lambda-python-how-to-create-deployment-package.html
* https://realpython.com/python-boto3-aws-s3/
* remove the array that JSON objects are wrapped in (https://stackoverflow.com/questions/27907633/multiple-json-objects-in-one-file-extract-by-python), Python generators https://wiki.python.org/moin/Generators? https://data-flair.training/blogs/python-generator-vs-iterator/?
