terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.0.0"
    }
  }
}

resource "scaleway_instance_server" "vianney-01" {
  type  = var.type_server
  image = "ubuntu_focal"
  name  = "vianney-01"

  tags = ["scaleway", "vianney-01"]

  ip_id = scaleway_instance_ip.public_ip.id
  
  additional_volume_ids = [scaleway_instance_volume.data.id]

  security_group_id = var.group_id

}

resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_volume" "data" {
  size_in_gb = var.size_disk
  type       = "b_ssd"
}
