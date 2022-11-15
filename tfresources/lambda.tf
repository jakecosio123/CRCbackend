resource "aws_lambda_permission" "APIGW_lambda" {
    statement_id = "AllowExecutionFromAPIGateway"
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.CRCLambda.function_name
    principal = "apigateway.amazonaws.com"
    source_arn = "arn:aws:execute-api:${var.myregion}:${var.accountId}:${aws_api_gateway_rest_api.CRCAPI.id}/*/${aws_api_gateway_method.CRCMethod.http_method}${aws_api_gateway_resource.CRCResource.path}"
}

resource "aws_lambda_function" "CRCLambda" {
    filename = "CRCLambda.zip"
    function_name = "CRCLambda"
    role = aws_iam_role.CRCLambdaRole.arn
    handler = "lambda_function.lambda_handler"
    runtime = "python3.9"
    }

resource "aws_iam_role" "CRCLambdaRole" {
    name = "CRCLambdaRole"
    assume_role_policy = jsonencode({
        "Version": "2012-10-17",
        "Statement": [
            {
                "Action": "sts:AssumeRole",
                "Principal": {
                    "Service": "lambda.amazonaws.com"
                },
                "Effect": "Allow",
                "Sid": ""
        }]
    })
    }

# resource "aws_iam_policy" "policy1" {
#     name = "LambdaRole1"
#     policy = jsonencode({
#         "Version": "2012-10-17",
#         "Statement": [
#             {
#                 "Action": "sts:AssumeRole",
#                 "Principal": {
#                     "Service": "lambda.amazonaws.com"
#                 },
#                 "Effect": "Allow",
#                 "Sid": ""
#         }]
#     })
# }

resource "aws_iam_role_policy" "policy1" {
    name = "LambdaRole1"
    role = aws_iam_role.CRCLambdaRole.id
    policy = jsonencode({
        "Version": "2012-10-17",
        "Statement": [{
                "Effect": "Allow",
                "Action": [
                    "dynamodb:DeleteItem",
                    "dynamodb:GetItem",
                    "dynamodb:PutItem",
                    "dynamodb:Scan",
                    "dynamodb:UpdateItem"
                ],
                "Resource": "${aws_dynamodb_table.CRCDBtable.arn}"
            } 
        ]
    })
}