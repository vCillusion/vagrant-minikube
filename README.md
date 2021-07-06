# Minikube Vagrant

Vagrant file based on kubernetes-the-hard-way repository

Note, this installs the latest `minikube` and `kubectl` packages available for ubuntu 20.04.

## Install Pre-requisites

Ensure you have vagrant installed (should also support mac/windows)

https://www.vagrantup.com/docs/installation/

## Run it

Clone this repo then:

```
vagrant up
```

## SSH into the VM
```
vagrant ssh
```

## Check minikube is up and running

```
kubectl get nodes
```