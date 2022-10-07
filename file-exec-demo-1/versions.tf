# terraform {
#   required_version = ">= 1.0.0"
# }
terraform {
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "3.1.0"
    }
  }
}