cd /tmp
curl -fsSL https://get.docker.com -o get-docker.sh
sh /tmp/get-docker.sh

sudo groupadd docker
sudo usermod -aG docker vagrant
newgrp docker

sudo chmod 666 /var/run/docker.sock
sudo chown $USER:$USER $HOME/.docker -R
sudo chmod g+rwx $HOME/.docker -R

sudo systemctl restart docker