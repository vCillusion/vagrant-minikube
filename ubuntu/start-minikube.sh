#!/bin/bash

# Disable SWAP since is not supported on a kubernetes cluster
sudo swapoff -a

## Start minikube
minikube start --kubernetes-version v$1 --driver=docker

## Addons
minikube addons enable ingress