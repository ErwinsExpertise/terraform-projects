resource "kubernetes_persistent_volume_claim" "wordpress-pvc" {
    metadata {
        name = var.PVC_NAME
        labels = {
            app = var.DEP_NAME
        }
    }
    spec {
        access_modes = ["ReadWriteOnce"]
        resources {
            requests = {
                storage = "1Gi"
            }
        }
    }

}