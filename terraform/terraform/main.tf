terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.0.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.11.0"
    }
  }
}

provider "docker" {}
provider "scaleway" {}

resource "scaleway_instance_server" "server" {
    count = var.number_instance
    type  = "${count.index}" == 3 ? "DEV1-XL" : var.type_server
    image = "ubuntu_focal"
    name  = "vianney-${count.index}"

    tags = ["vianney-${count.index}"]

    ip_id = scaleway_instance_ip.public_ip[count.index].id
  
    additional_volume_ids = [scaleway_instance_volume.data[count.index].id]
    
}

resource "scaleway_vpc_private_network" "vianney_network" {
    name = "vianney_network"
    tags = ["vianney", "terraform"]
}

resource "scaleway_instance_private_nic" "pnic01" {
    count = var.number_instance
    server_id          = scaleway_instance_server.server[count.index].id
    private_network_id = scaleway_vpc_private_network.vianney_network.id
}


resource "scaleway_instance_ip" "public_ip" {
    count = var.number_instance
}

resource "scaleway_instance_volume" "data" {
    count = var.number_instance
    size_in_gb = 30
    type       = "b_ssd"
}

module "application"{
    source = "./modules/application"
}

module "elasticsearch"{
    source = "./modules/elasticsearch"
}
