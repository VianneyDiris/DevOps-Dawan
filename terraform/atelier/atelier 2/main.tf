terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.0.0"
    }
  }

  backend "s3" {
    bucket                      = "backend-tf"
    key                         = "vianney/state.tfstate"
    region                      = "fr-par"
    endpoint                    = "https://s3.fr-par.scw.cloud"
    skip_credentials_validation = true
    skip_region_validation      = true
  }
}

provider "scaleway" {}

module "server" {
  count = terraform.workspace == "default" ? 1 : var.number_instance
  source = "./modules/server"
  group_id = module.security.scaleway_security_id
  type_server = var.type_server
  size_disk = var.size_disk
}

module "security"{
    source = "./modules/security"
}

module "kubernetes"{
    source = "./modules/kubernetes"
}

module "helms"{
    source = "./modules/helms"
}



