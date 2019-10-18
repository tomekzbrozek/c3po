![](https://github.com/tomekzbrozek/c3po/blob/master/theme-picture.png)

C3PO uses [IEX Trading](https://iextrading.com/developer/) data to collect historical prices of stocks traded on NYSE and NASDAQ on a regular basis and save in AWS S3.

How to do terraform apply:

```
cd terraform && terraform apply
```

How to zip lambda function:

```
zip -r iex_api_last.py terraform/iex_api_last.zip
```

To Do:


0. Deployment package! I.e. how to install library: https://docs.aws.amazon.com/lambda/latest/dg/lambda-python-how-to-create-deployment-package.html

1. https://realpython.com/python-boto3-aws-s3/
2. remove the array that JSON objects are wrapped in (https://stackoverflow.com/questions/27907633/multiple-json-objects-in-one-file-extract-by-python), Python generators https://wiki.python.org/moin/Generators? https://data-flair.training/blogs/python-generator-vs-iterator/?
3. add logging!
4.
