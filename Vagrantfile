# -*- mode: ruby -*-
# vi: set ft=ruby :

IP_NW = "192.168.5.10"

VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 2"

# Memory & CPUs
MEM = 4096
CPUS = 2
HOSTNAME = "minikube-vagrant"
VMBOX = "ubuntu/focal64"

# Minikube Variables
KUBERNETES_VERSION = "1.21.1"

# VirtualBox Variables
GUEST_ADDITION_VERSION = "6.1.24"

# Entry point of this Vagrantfile
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = VMBOX
  config.vbguest.auto_update = false

  config.vm.define HOSTNAME do |node|

    node.vm.provider "virtualbox" do |vb|
        vb.name = HOSTNAME
        vb.memory = MEM
        vb.cpus = CPUS
    end
    node.vm.hostname = HOSTNAME
    node.vm.network :private_network, ip: IP_NW
    node.vm.network "forwarded_port", guest: 22, host: "27101"

    node.vm.provision "setup-hosts", :type => "shell", :path => "ubuntu/vagrant/setup-hosts.sh" do |setup_hosts|
      setup_hosts.args = ["enp0s8", HOSTNAME]
    end

    # Script to prepare the VM
    node.vm.provision "setup-dns", type: "shell", :path => "ubuntu/update-dns.sh"
    node.vm.provision "install-docker", type: "shell", :path => "ubuntu/install-docker.sh"
    node.vm.provision "install-minikube", :type => "shell", :path => "ubuntu/install-minikube.sh" do |install_minikube|
      install_minikube.args = [KUBERNETES_VERSION]
    end
    
    node.vm.provision "allow-bridge-nf-traffic", :type => "shell", :path => "ubuntu/allow-bridge-nf-traffic.sh"

    node.vm.provision "install-minikube", :type => "shell", :path => "ubuntu/install-minikube.sh" do |install_minikube|
      install_minikube.args = [KUBERNETES_VERSION]
    end

    node.vm.provision "start-minikube", :type => "shell", :path => "ubuntu/start-minikube.sh", privileged: false do |install_minikube|
      install_minikube.args = [KUBERNETES_VERSION]
    end

  end
end