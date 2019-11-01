C3PO uses [IEX Trading](https://iextrading.com/developer/) data to collect historical prices of stocks traded on NYSE and NASDAQ on schedule and save in AWS S3.

# To Do:
1. ship R2 as a repo
2. deploy a service on EC2 that runs historical data population for IEX API
3. set up Redshift cluster

# Arch / to read:

* zip with: https://github.com/hashicorp/terraform/issues/19080, https://www.terraform.io/docs/providers/archive/d/archive_file.html?
* Deployment package in Docker:
https://blog.quiltdata.com/an-easier-way-to-build-lambda-deployment-packages-with-docker-instead-of-ec2-9050cd486ba8
https://www.reddit.com/r/aws/comments/93jhgi/how_can_i_add_third_party_python_dependencies_to/
* add a step that removes all packages from `lambda/` before downloading packages
* add logging http://nathanielobrown.com/blog/posts/quick_and_dirty_python_logging_lesson.html
* how to run cron jobs in AWS: https://medium.com/better-programming/cron-job-patterns-in-aws-126fbf54a276

* Deployment package! I.e. how to install library: https://docs.aws.amazon.com/lambda/latest/dg/lambda-python-how-to-create-deployment-package.html
* https://realpython.com/python-boto3-aws-s3/
* remove the array that JSON objects are wrapped in (https://stackoverflow.com/questions/27907633/multiple-json-objects-in-one-file-extract-by-python), Python generators https://wiki.python.org/moin/Generators? https://data-flair.training/blogs/python-generator-vs-iterator/?
