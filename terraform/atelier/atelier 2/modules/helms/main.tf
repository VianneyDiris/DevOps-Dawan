terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.0.0"
    }
  }
}

resource "helm_release" "example" {
  name  = "redis"
  chart = "bitnami/redis"
}