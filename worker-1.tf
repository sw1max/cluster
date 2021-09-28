# Create a worker-1 server
resource "digitalocean_droplet" "worker-1" {
  image    = "ubuntu-20-04-x64"
  name     = "worker-1"
  region   = "fra1"
  size     = "s-2vcpu-2gb"
  ssh_keys = [data.digitalocean_ssh_key.terraform.fingerprint]
}