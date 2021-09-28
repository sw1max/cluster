# Create a controller-0 server
resource "digitalocean_droplet" "controller-0" {
  image    = "ubuntu-20-04-x64"
  name     = "controller-0"
  region   = "fra1"
  size     = "s-2vcpu-2gb"
  ssh_keys = [data.digitalocean_ssh_key.terraform.fingerprint]
}
