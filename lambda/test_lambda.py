def handler(event, context):

    import urllib.request
    import json
    import boto3
    import os

    s3_resource = boto3.resource(
        's3',
        aws_access_key_id=os.environ['TF_VAR_TOMEK_AWS_ACCESS_KEY_ID'],
        aws_secret_access_key=os.environ['TF_VAR_TOMEK_AWS_SECRET_ACCESS_KEY']
    )

    with urllib.request.urlopen('https://api.iextrading.com/1.0/tops/last') as url:
        last = json.loads(url.read().decode())

        s3_object_name = str(uuid.uuid4()) + '.json'
        s3_object = s3_resource.Object('iex-trading', s3_object_name)

        s3_object.put(
            Body=(bytes(json.dumps(last).encode('UTF-8')))
        )
