resource "aws_lambda_permission" "APIGW_lambda" {
    statement_id = "AllowExecutionFromAPIGateway"
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.CRCLambda.function_name
    principal = "apigateway.amazonaws.com"
    source_arn = "arn:aws:execute-api:${var.myregion}:${var.accountId}:${aws_api_gateway_method.CRCMethod.http_method}${aws_api_gateway_resource.CRCResource.path}"
}

resource "aws_lambda_function" "CRCLambda" {
    filename = "CRCLambda.zip"
    function_name = "CRCLambda"
    role = aws_iam_role.CRCLambdaRole.arn
    handler = "lambda.lambda_handler"
    runtime = "python3.8"
    }

resource "aws_iam_role" "CRCLambdaRole" {
    name = "CRCLambdaRole"

    assume_role_policy = <<EOF
    {
        "Version": "2012-10-17",
         "Statement": [
            {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "lambda.amazonaws.com"
                },
            "Effect": "Allow",
            "Sid": ""
        }   
        ]
    }
    EOF
}