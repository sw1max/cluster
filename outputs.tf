output "droplet_ip_addresses" {
  value = {
    for droplet in digitalocean_droplet.node :
    droplet.name => droplet.ipv4_address
  }
  sensitive = true
}