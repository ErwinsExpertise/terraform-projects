#export TF_VAR_DEP_NAME=<deployment-name>
#export TF_VAR_PV_NAME=<persistent volume name>
#export TF_VAR_PVC_NAME=<persistent volume claim name>
#export TF_VAR_DB_HOST=<database host>
#export TF_VAR_DB_USER=<database user>
#export TF_VAR_DB_PASS=<database password>
resource "kubernetes_deployment" "wordpress-dep" {
    metadata {
        name = var.DEP_NAME
        labels = {
            app = var.DEP_NAME
        }#end of labels
    } #end of metadata
    spec {
        selector {
            match_labels = {
                app = var.DEP_NAME
                tier = "frontend"
            }#end of matchLabels
        }#end of selector
        strategy {
            type = "Recreate"
        }#end of strategy
        template {
            metadata {
                labels = {
                    app = var.DEP_NAME
                    tier = "frontend"
                }#end of labels
            }#end of template metadata
            spec {
                container {
                    image = "wordpress:latest"
                    name = var.DEP_NAME
                    env {
                        name = "WORDPRESS_DB_HOST" 
                        value = var.DB_HOST
                        }
                    env {
                        name = "WORDPRESS_DB_PASSWORD" 
                        value = var.DB_PASS
                        }
                    env {
                        name = "WORDPRESS_DB_USER"
                        value = var.DB_USER
                        }
                    port {
                        container_port = 80
                        name = var.DEP_NAME
                    }
                    volume_mount {
                        name = var.PV_NAME
                        mount_path = "/var/www/html"
                    }
                }#end of containers
                volume {
                    name = var.PV_NAME
                    persistent_volume_claim {
                        claim_name = var.PVC_NAME
                    }
                }
            }#end of spec
        }#end of template
    }#end of spec
}