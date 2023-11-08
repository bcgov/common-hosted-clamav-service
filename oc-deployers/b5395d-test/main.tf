module "oc_deployer" {
  source  = "bcgov/openshift/deployer"
  version = "0.11.0"

  name                  = "oc-deployer"
  namespace             = "b5395d-test"
  privileged_namespaces = ["b5395d-test"]
}
