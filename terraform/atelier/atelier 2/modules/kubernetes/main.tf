terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.0.0"
    }
  }
}

resource "scaleway_k8s_cluster" "vianney-cluster" {
  name    = "vianney-cluster"
  version = "1.19.4"
  cni     = "cilium"
}

resource "scaleway_k8s_pool" "vianney-pool" {
  cluster_id = scaleway_k8s_cluster.vianney-cluster.id
  name       = "vianney-pool"
  node_type  = "DEV1-M"
  size       = 2
}