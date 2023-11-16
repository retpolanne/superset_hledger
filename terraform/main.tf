data "cloudinit_config" "superset_setup" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "cloud-config.yaml"
    content_type = "text/cloud-config"

    content = file("${path.module}/cloud-config.yaml")
  }
}

resource "digitalocean_droplet" "superset" {
  image     = "debian-12-x64"
  name      = "superset"
  region    = "nyc1"
  size      = "s-1vcpu-1gb"
  user_data = data.cloudinit_config.superset_setup.rendered
}
