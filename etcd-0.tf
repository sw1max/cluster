# Create a etcd-0 server
resource "digitalocean_droplet" "etcd-0" {
  image    = "ubuntu-20-04-x64"
  name     = "etcd-0"
  region   = "fra1"
  size     = "s-2vcpu-2gb"
  ssh_keys = [data.digitalocean_ssh_key.terraform.fingerprint]
}