#!/bin/bash
echo "Введіть ваше ім'я:"
read username

#git clone https://github.com/andrijbikov134/Rozetka_clone.git
#cd ./Rozetka_clone

echo "127.0.1.1 $(hostname)" | sudo tee -a /etc/hosts

apt update && sudo apt upgrade -y
apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl restart docker
systemctl status docker

echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf
sysctl -p

chattr -i /etc/resolv.conf
rm /etc/resolv.conf
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
chattr +i /etc/resolv.conf

apt install -y iptables-persistent
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
iptables -L -v -n
systemctl start iptables.service
systemctl enable iptables.service
netfilter-persistent save
systemctl status iptables.service

apt install -y certbot python3-certbot-nginx
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout ./proxy/certs/selfsigned.key \
    -out ./proxy/certs/selfsigned.crt \
    -subj "/CN=localhost"
openssl dhparam -out ./proxy/certs/dhparam.pem 2048
openssl req -newkey rsa:2048 -nodes -keyout ./database/certs/mysql-server.key \
    -x509 -days 365 -out ./database/certs/mysql-server.crt \
    -subj "/CN=localhost"
cp ./database/certs/mysql-server.crt ./database/certs/mysql-ca.pem

apt install -y apache2-utils
htpasswd -c ./proxy/.htpasswd admin
cat ./proxy/.htpasswd

chown -R ${username}:${username} ../Rozetka_clone

echo "END"

usermod -aG docker ${username}
newgrp docker