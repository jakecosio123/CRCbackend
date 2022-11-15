data "aws_route53_zone" "CRCprimary" {
    name = "jcosioresume.com"
    private_zone = false
}

data "aws_acm_certificate" "CRCACMCert" {
    domain = "jcosioresume.com"
}

resource "aws_acm_certificate_validation" "CRCACMValid" {
  certificate_arn = data.aws_acm_certificate.CRCACMCert.arn
}

resource "aws_route53_record" "CRCRecord" {
    name = aws_api_gateway_domain_name.CRCAPIDomainName.domain_name
    type = "A"
    zone_id = data.aws_route53_zone.CRCprimary.id

    alias {
      evaluate_target_health = true
      name = aws_api_gateway_domain_name.CRCAPIDomainName.regional_domain_name
      zone_id = aws_api_gateway_domain_name.CRCAPIDomainName.regional_zone_id
    }
}