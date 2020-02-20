provider "digitalocean" {
    token = "Enter digitalocean account token here"
}

resource "digitalocean_droplet" "clouldComputer" {
    image = "ubuntu-19-10-x64"
    name = "clouldComputerJon"
    region = "nyc1"
    size = "1gb"
    tags = ["lb"]
    ssh_keys = ["Enter your SSH key Fingerprints here"]
}
resource "digitalocean_droplet" "clouldComputer2" {
    image = "ubuntu-19-10-x64"
    name = "clouldComputerJon2"
    region = "nyc1"
    size = "1gb"
    tags = ["lb"]
    ssh_keys = ["Enter your SSH key Fingerprints here"]
}
resource "digitalocean_droplet" "clouldComputer3" {
    image = "ubuntu-19-10-x64"
    name = "clouldComputerJon3"
    region = "nyc1"
    size = "1gb"
    tags = ["lb"]
    ssh_keys = ["Enter your SSH key Fingerprints here"]
}

resource "digitalocean_loadbalancer" "LB" {
	name = "LB"
	region = "nyc1"

	forwarding_rule {
		entry_port = 80
		entry_protocol = "http"
		
		target_port = 80
		target_protocol = "http"
	}
	
	healthcheck {
		port = 22
		protocol = "tcp"
	}

	droplet_tag = "lb"
}
