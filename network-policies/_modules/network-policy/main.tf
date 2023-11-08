# See https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy
resource "kubernetes_network_policy" "this" {
  metadata {
    name        = "allow-${var.target_license_plate}-${var.environment}"
    namespace   = "${var.license_plate}-${var.environment}"
    annotations = {}
    labels = {
      "app.kubernetes.io/managed-by" = "terraform"
      "app.kubernetes.io/part-of"    = "clamav"
    }
  }

  spec {
    pod_selector {}

    ingress {
      # ports {
      #   protocol = "TCP"
      # }

      from {
        namespace_selector {
          match_labels = {
            "name"                        = var.target_license_plate
            "kubernetes.io/metadata.name" = "${var.target_license_plate}-${var.environment}"
            "environment"                 = var.environment
          }
        }
      }
    }

    egress {} # single empty rule to allow all egress traffic

    policy_types = ["Ingress", "Egress"]
  }
}
