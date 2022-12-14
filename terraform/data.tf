data "digitalocean_ssh_key" "do_key_01" {
  name = "do_key_01"
}

data "digitalocean_kubernetes_cluster" "example" {
  name = "cluster"
  depends_on = [
    digitalocean_kubernetes_cluster.cluster
  ]
}

