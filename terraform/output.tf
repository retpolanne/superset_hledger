output "droplet_ip" {
  value = digitalocean_droplet.superset.ipv4_address
}
