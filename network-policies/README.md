# Openshift Network Policy Provision

In order to implement `configuration as code` and simplify the process of configuring Openshift Network Policies for managing access to ClamAV instances, we rely on a powerful tool called [Terraform](https://www.terraform.io/).

## Procedure

1. Go to the target environment directory:

   ```sh
   cd <cluster-name>/<environment>
   ```

2. Create a file that includes the necessary information to establish access to the target environment:
   ```sh
   cat <<EOF > <license-plate>.tf
   module "<license-plate>" {
     source        = "./network-policy"
     license_plate = "<license-plate>"
   }
   EOF
   ```

- Example

  ```sh
  cd silver/dev
  cat <<EOF > abcdef.tf
  module "abcdef" {
  source        = "./network-policy"
  license_plate = "abcdef"
  }
  EOF
  ```
