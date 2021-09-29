resource "digitalocean_droplet" "node" {
  for_each = toset(var.droplet_names)
  image    = "ubuntu-20-04-x64"
  name     = each.value
  region   = "fra1"
  size     = "s-2vcpu-2gb"
  ssh_keys = [data.digitalocean_ssh_key.terraform.id]
}
