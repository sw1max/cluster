# Create a etcd-2 server
resource "digitalocean_droplet" "etcd-2" {
  image    = "ubuntu-20-04-x64"
  name     = "etcd-2"
  region   = "fra1"
  size     = "s-2vcpu-2gb"
  ssh_keys = [data.digitalocean_ssh_key.terraform.fingerprint]
}