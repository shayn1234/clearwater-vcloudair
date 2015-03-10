#!/bin/bash -ex
echo "192.168.10.4 chef-server2" | sudo tee -a /etc/hosts
sudo mkdir -p /etc/chef/ohai/hints
echo true | sudo tee /etc/chef/ohai/hints/hp.json
echo '127.0.0.1 sprout' | sudo tee -a /etc/hosts
name=$(ctx node name)
ip=$(ctx instance host_ip)
echo "$name $ip" > /home/ubuntu/forohai

