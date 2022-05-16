resource "random_password" "secret" {
  length  = 24
  special = true
}