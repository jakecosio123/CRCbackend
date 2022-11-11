resource "aws_api_gateway_rest_api" "CRCAPI" {
    name = "CRCAPI"
    description = "This is the API for the cloud resume challenge"
}

resource "aws_api_gateway_resource" "CRCResource" {
    rest_api_id = aws_api_gateway_rest_api.CRCAPI.id
    parent_id = aws_api_gateway_rest_api.CRCAPI.root_resource_id
    path_part = "CRCResource"
}

resource "aws_api_gateway_method" "CRCMethod" {
    rest_api_id = aws_api_gateway_rest_api.CRCAPI.id
    resource_id = aws_api_gateway_resource.CRCResource.id
    http_method = "POST"
    authorization = "NONE"
}

resource "aws_api_gateway_method_response" "response_200" {
    rest_api_id = aws_api_gateway_rest_api.CRCAPI.id
    resource_id = aws_api_gateway_resource.CRCResource.id
    http_method = aws_api_gateway_method.CRCMethod.http_method
    status_code = "200"
}

resource "aws_api_gateway_integration" "CRCintegration" {
    rest_api_id = aws_api_gateway_rest_api.CRCAPI.id
    resource_id = aws_api_gateway_resource.CRCResource.id
    http_method = aws_api_gateway_method.CRCMethod.http_method
    integration_http_method = "POST"
    type = "AWS_PROXY"
    uri = aws_lambda_function.CRCLambda.invoke_arn
}

resource "aws_api_gateway_domain_name" "CRCAPIDomainName" {
    domain_name = "crcapi.jcosioresume.com"
    regional_certificate_arn = aws_acm_certificate_validation.CRCACMCert.certificate_arn

    endpoint_configuration {
      types = ["REGIONAL"]
    }

}







