# Get Hosted Zone Details
data "aws_route53_zone" "hosted_zone" {
  name = var.domain_name
}

# Create a Record Set in Route 53
resource "aws_route53_record" "site_domain" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = var.record_name
  type    = var.record_type

  alias {
    name                   = aws_lb.application_load_balancer.dns_name
    zone_id                = aws_lb.application_load_balancer.zone_id
    evaluate_target_health = var.evaluate_target_health
  }
}

// Here you need to purchase a domain to effectively move with the project NOTE that you need to referrence them here on VScode.//
//Once your able to get everything set up, then you would be able to access the website using the Domain name //