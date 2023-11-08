# Common Hosted ClamAV Service

## Docker

To address `clamav` user requirements for the official `ClamAV` container images, we have developed and deployed an `unprivileged` version of ClamAV container images using `GitHub Packages`. This mitigates privilege issues on Openshift.

- See [Dockerfile](docker/Dockerfile) for more detailed information about the Docker container.
- See [Build and Publish ClamAV Image](.github/workflows/publish-clamav.yml) to understand the build pipeline.
- See [clamav-unprivileged](https://github.com/bcgov/common-hosted-clamav-service/pkgs/container/clamav-unprivileged) to find the list of published images.

## Helm

We utilize Helm charts to deploy ClamAV instances and related Kubernetes resources on Openshift clusters.

### Deployments

- If you are deploying from your local station, follow these steps:

  1. Log in to the target Openshift cluster:

  ```sh
  oc login --token=sha256~abcdef --server=https://api.<cluster>.devops.gov.bc.ca:6443
  ```

  2. Navigate to the main Helm directory:

  ```sh
  cd helm/main
  ```

  3. Install/upgrade Helm deployments using `Make` commands:

  ```sh
  make upgrade NAMESPACE=<namespace> IMAGE_TAG=<clamav-image-tag>
  ```

  - Refer to [clamav-unprivileged](https://github.com/bcgov/common-hosted-clamav-service/pkgs/container/clamav-unprivileged) for the list of published images.

- If you want to deploy via `GitHub UI` using workflow dispatch, follow these steps:

  1. Navigate to the `Deploy ClamAV` GitHub workflow dispatch.

     - https://github.com/bcgov/common-hosted-clamav-service/actions/workflows/deploy.yml

  2. Click the `Run workflow` button on the right.
  3. Select the target environment for ClamAV deployment.
  4. Enter the image tag version.

  - Refer to [clamav-unprivileged](https://github.com/bcgov/common-hosted-clamav-service/pkgs/container/clamav-unprivileged) for the list of published images.

  5. Click the `Run workflow` green button in the popup.

## Load Testing

To run load testing jobs on Openshift clusters, we build and deploy the load-testing container image using `GitHub Packages`.

- See [Dockerfile](load-testing/Dockerfile) for detailed information about the Docker container.
- See [Build and Publish ClamAV Image](.github/workflows/publish-clamav-load-testing.yml) to understand the build pipeline.
- See [clamav-load-testing](https://github.com/bcgov/common-hosted-clamav-service/pkgs/container/clamav-load-testing) to find the list of published images.

### Deployments

- Please follow the steps below:

  1. Log in to the target Openshift cluster where you want to run the load testing:

  ```sh
  oc login --token=sha256~abcdef --server=https://api.<cluster>.devops.gov.bc.ca:6443
  ```

  2. Navigate to the load-testing directory:

  ```sh
  cd load-testing
  ```

  3. Create the load testing Job:

  ```sh
  kubectl apply -f job.yaml
  ```

  - You may want to update the target ClamAV host environment variable `CLAMAV_HOST`

  4. Delete the load testing Job:

  ```sh
  kubectl delete -f job.yaml
  ```

## OC Deployers

We utilize Terraform to generate the `Openshift service account token` for use in GitHub pipelines.

- See [oc-deployers - README.md](./oc-deployers/README.md) for detailed information and instructions.

## Network Policies

We utilize Terraform to configure `Openshift Network Policies` for managing access to ClamAV instances.

- See [network-policies - README.md](./network-policies/README.md) for detailed information and instructions.
