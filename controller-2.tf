# Create a controller-2 server
resource "digitalocean_droplet" "controller-2" {
  image    = "ubuntu-20-04-x64"
  name     = "controller-2"
  region   = "fra1"
  size     = "s-2vcpu-2gb"
  ssh_keys = [data.digitalocean_ssh_key.terraform.fingerprint]
}