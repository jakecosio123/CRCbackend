resource "aws_route53_zone" "CRCprimary" {
    name = "jcosioresume.com"
}


resource "aws_acm_certificate" "CRCACMCert" {
    domain_name = "jcosioresume.com"
    validation_method = "DNS"
}

resource "aws_route53_record" "CRCRecord" {
    name = aws_api_gateway_domain_name.CRCAPIDomainName.domain_name
    type = "A"
    zone_id = aws_route53_zone.CRCzone.zone_id

    alias {
      evaluate_target_health = true
      name = aws_api_gateway_domain_name.CRCAPIDomainName.regional_domain_name
      zone_id = aws_api_gateway_domain_name.CRCAPIDomainName.regional_zone_id
    }
}