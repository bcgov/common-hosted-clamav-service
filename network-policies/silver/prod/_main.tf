terraform {
  required_version = ">= 1.6.2"

  backend "kubernetes" {
    namespace     = "b5395d-prod"
    secret_suffix = "network-policies" # pragma: allowlist secret
    config_path   = "~/.kube/config"
  }

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "=2.23.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}
