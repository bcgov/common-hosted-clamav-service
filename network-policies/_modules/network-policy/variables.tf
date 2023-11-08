variable "license_plate" {
  description = "The namespace's license plate in which ClamAV instances are deployed"
  type        = string
}

variable "environment" {
  description = "The environment in which ClamAV instances are running"
  type        = string
}

variable "target_license_plate" {
  description = "The namespace's license plate that has access to ClamAV instances"
  type        = string
}
