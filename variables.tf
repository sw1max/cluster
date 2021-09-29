variable "droplet_names" {
  type    = list(string)
  default = ["controller-0", "controller-1", "controller-2", "worker-0", "worker-1", "worker-2", "etcd-0", "etcd-1", "etcd-2"]
}