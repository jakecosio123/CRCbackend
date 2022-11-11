import boto3
import json

dynamodb = boto3.resource('dynamodb')

def lambda_handler(event, context):
    table = dynamodb.Table('ResumeBuilder')

    ddbResponse = table.update_item(
        Key={'Website':  'jcosioresume.com'},
        UpdateExpression='ADD VisitorCount :inc',
        ExpressionAttributeValues={':inc': 1},
        ReturnValues="UPDATED_NEW",
    )
    return ddbResponse
    print(ddbResponse)