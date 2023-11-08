module "network_policy" {
  source = "../../../_modules/network-policy"

  license_plate        = "b5395d"
  environment          = "prod"
  target_license_plate = var.license_plate
}
