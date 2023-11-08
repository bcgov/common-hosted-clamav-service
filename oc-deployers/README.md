# Openshift Deployment with Terraform

In order to implement `configuration as code` and streamline the process of creating an `Openshift service account token` for `GitHub Actions` to deploy k8s resources on an Openshift cluster, we utilize a tool called [Terraform](https://www.terraform.io/).

## Procedure

1. Go to the target namespace directory:

   ```sh
   cd <namespace>
   ```

2. Initialize the working directory containing the Terraform configuration files:
   ```sh
   terraform init
   ```
3. Preview the changes Terraform intends to make to your infrastructure:
   ```sh
   terraform plan
   ```
4. Execute the actions specified in the Terraform plan:
   ```sh
   terraform apply
   ```
