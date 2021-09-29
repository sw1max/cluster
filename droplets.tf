resource "digitalocean_droplet" "node" {
  for_each = toset(var.droplet_names)
  image    = "ubuntu-20-04-x64"
  name     = each.value
  region   = "fra1"
  size     = "s-2vcpu-2gb"
  ssh_keys = [data.digitalocean_ssh_key.terraform.id]

  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.pvt_key)
  }

  provisioner "remote-exec" {
    inline = [
      # add scripts
      "modprobe br_netfilter",
      "echo 1 > /proc/sys/net/ipv4/ip_forward",
      "sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg",
      "echo 'deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main' | sudo tee /etc/apt/sources.list.d/kubernetes.list",
      "apt update",
      "apt upgrade -y",
      "apt install -y kubelet kubeadm kubectl",
      "apt-mark hold kubelet kubeadm kubectl",
      "apt install -y containerd",
      # Non-root user
      # "mkdir -p $HOME/.kube",
      # "cp -i /etc/kubernetes/admin.conf $HOME/.kube/config",
      # "chown $(id -u):$(id -g) $HOME/.kube/config"
      # Root user
      "export KUBECONFIG=/etc/kubernetes/admin.conf",
      "curl -L --remote-name-all https://github.com/cilium/cilium-cli/releases/latest/download/cilium-linux-amd64.tar.gz{,.sha256sum}",
      "sha256sum --check cilium-linux-amd64.tar.gz.sha256sum",
      "sudo tar xzvfC cilium-linux-amd64.tar.gz /usr/local/bin",
      "rm cilium-linux-amd64.tar.gz{,.sha256sum}",
      "cilium install"
    ]
  }
}
