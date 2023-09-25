provider "tfe" {
    token = var.token
}

variable "token" {}

data "tfe_slug" "test_slug_policyset" {
source_path = "policy-sets/qaent-dev-azure-sentinel-policy-set"
}

resource "tfe_policy_set" "test_slug_based_policy_set" {

name = "test-policy-set"

description = "A test policy set"
organization = "hashicorp-matthew"

slug = data.tfe_slug.test_slug_policyset
}
