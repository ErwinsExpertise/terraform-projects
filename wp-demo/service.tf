resource "kubernetes_service" "wordpress-service" {
    metadata {
        name = var.DEP_NAME
        labels = {
            app = var.DEP_NAME
        }
    }
    spec {
        selector = {
        app = var.DEP_NAME
        tier = "frontend"
    }
    port {
        port = 80
    }
    type = "LoadBalancer"
    }
}