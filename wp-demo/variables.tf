#export TF_VAR_cluster_name=<cluster-name>
#export TF_VAR_DEP_NAME=<deployment-name>
#export TF_VAR_PV_NAME=<persistent volume name>
#export TF_VAR_PVC_NAME=<persistent volume claim name>
#export TF_VAR_DB_HOST=<database host>
#export TF_VAR_DB_USER=<database user>
#export TF_VAR_DB_PASS=<database password>

variable "cluster_name" {
  default = "kube-cluster"
}
variable "DEP_NAME" {
  default = "terra-wp"
}

variable "PV_NAME" {
  default = "terra-wp-pv"
}

variable "PVC_NAME" {
  default = "terra-wp-pvc"
}

variable "DB_HOST" {
  default = "localhost"
}

variable "DB_USER" {
  default = "root"
}

variable "DB_PASS" {
  default = "password"
}