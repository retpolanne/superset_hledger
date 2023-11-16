resource "github_repository" "superset_hledger" {
  name        = "superset_hledger"
  description = "Provisioning Superset for Hledger"
  private      = false
}

data "github_actions_public_key" "pubkey" {
  repository = github_repository.superset_hledger.name
}

resource "github_actions_secret" "do_access_token" {
  repository       = github_repository.superset_hledger.name
  secret_name      = "DO_ACCESS_TOKEN"
  encrypted_value  = var.digitalocean_access_token
}

resource "github_actions_secret" "do_spaces_akia" {
  repository       = github_repository.superset_hledger.name
  secret_name      = "AWS_ACCESS_KEY_ID"
  encrypted_value  = var.digitalocean_spaces_akia
}

resource "github_actions_secret" "do_spaces_secret" {
  repository       = github_repository.superset_hledger.name
  secret_name      = "AWS_SECRET_ACCESS_KEY"
  encrypted_value  = var.digitalocean_spaces_secret
}
