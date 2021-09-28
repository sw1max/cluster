# Create a etcd-1 server
resource "digitalocean_droplet" "etcd-1" {
  image    = "ubuntu-20-04-x64"
  name     = "etcd-1"
  region   = "fra1"
  size     = "s-2vcpu-2gb"
  ssh_keys = [data.digitalocean_ssh_key.terraform.fingerprint]
}