terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
  # backend "http" {}
}

variable "ssh_key" {
  default = "ssh_key"
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "cluster" {
  name    = "cluster"
  region  = "nyc1"
  version = "1.24.8-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-8gb"
    node_count = 2
  }

  provisioner "local-exec" {
    command = "doctl kubernetes cluster kubeconfig save ${digitalocean_kubernetes_cluster.cluster.id}"
  }

}
