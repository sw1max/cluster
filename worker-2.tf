# Create a worker-2 server
resource "digitalocean_droplet" "worker-2" {
  image    = "ubuntu-20-04-x64"
  name     = "worker-2"
  region   = "fra1"
  size     = "s-2vcpu-2gb"
  ssh_keys = [data.digitalocean_ssh_key.terraform.fingerprint]
}