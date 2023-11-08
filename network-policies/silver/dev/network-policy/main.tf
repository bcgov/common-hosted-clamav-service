module "network_policy" {
  source = "../../../_modules/network-policy"

  license_plate        = "b5395d"
  environment          = "dev"
  target_license_plate = var.license_plate
}
