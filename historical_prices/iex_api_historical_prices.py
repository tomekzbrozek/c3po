import requests
import json
import boto3
import os
import uuid
import logging

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

# s3_resource = boto3.resource(
#     's3',
#     aws_access_key_id=os.environ['TOMEK_AWS_ACCESS_KEY_ID'],
#     aws_secret_access_key=os.environ['TOMEK_AWS_SECRET_ACCESS_KEY']
# )

def historical_prices(symbol, range):
    request_url_template = 'https://cloud.iexapis.com/v1/stock/{symbol}/chart/{range}?token={token}'
    request_url = request_url_template.format(symbol = symbol, range = range, token = os.environ['TF_VAR_IEX_TOKEN'])
    response = requests.get(request_url)

    if response.status_code != 200:
        raise Exception(f"{response.status_code}: {response.content.decode('utf-8')}")
    result = response.json()

    # s3_object_name = str(uuid.uuid4())
    # s3_object = s3_resource.Object('iex-trading', s3_object_name)

    # s3_object.put(
    #     Body=(bytes(json.dumps(result).encode('UTF-8')))
    # )
    #
    # return(s3_object_name)
    print(result)

historical_prices('tsla', 'max')
