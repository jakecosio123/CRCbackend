variable "accountId" {
    default = "291242051131"
    }
variable "myregion" {
    default = "us-east-1"
    }
variable "my_domain" {
  default = "jcosioresume.com"
}
provider "aws" {
    region = "us-east-1"
}