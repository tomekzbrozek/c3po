def handler(event, context):

    import requests
    import json
    import boto3
    import os
    import uuid

    s3_resource = boto3.resource(
        's3',
        aws_access_key_id=os.environ['TF_VAR_TOMEK_AWS_ACCESS_KEY_ID'],
        aws_secret_access_key=os.environ['TF_VAR_TOMEK_AWS_SECRET_ACCESS_KEY']
    )

    def last():
        request_url = 'https://api.iextrading.com/1.0/tops/last'
        response = requests.get(request_url)

        if response.status_code != 200:
            raise Exception(f"{response.status_code}: {response.content.decode('utf-8')}")
        result = response.json()

        s3_object_name = str(uuid.uuid4())
        s3_object = s3_resource.Object('iex-trading', s3_object_name)

        s3_object.put(
            Body=(bytes(json.dumps(result).encode('UTF-8')))
        )

    last()
