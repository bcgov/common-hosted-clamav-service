module "network_policy" {
  source = "../../../_modules/network-policy"

  license_plate        = "b5395d"
  environment          = "test"
  target_license_plate = var.license_plate
}
