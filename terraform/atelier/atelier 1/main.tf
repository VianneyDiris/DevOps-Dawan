terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.0.0"
    }
  }
}

provider "scaleway" {}

resource "scaleway_instance_server" "vianney-01" {
  type  = "DEV1-S"
  image = "ubuntu_focal"
  name  = "vianney-01"

  tags = ["scaleway", "vianney-01"]

  ip_id = scaleway_instance_ip.public_ip.id

  additional_volume_ids = [scaleway_instance_volume.data.id]

  security_group_id = scaleway_instance_security_group.scaleway.id

}

resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_volume" "data" {
  size_in_gb = 20
  type       = "b_ssd"
}

resource "scaleway_instance_security_group" "scaleway" {
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action = "accept"
    port   = 22
  }

  inbound_rule {
    action = "accept"
    port   = 80
  }
}
