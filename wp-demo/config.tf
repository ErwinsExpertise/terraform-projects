data "digitalocean_kubernetes_cluster" "terra" {
  name = var.cluster_name
}

provider "kubernetes" {
  host  = data.digitalocean_kubernetes_cluster.terra.endpoint
  token = data.digitalocean_kubernetes_cluster.terra.kube_config[0].token
  cluster_ca_certificate = base64decode(
    data.digitalocean_kubernetes_cluster.terra.kube_config[0].cluster_ca_certificate
  )
}
