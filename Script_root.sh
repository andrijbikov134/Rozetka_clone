#!/bin/bash
#echo "Введіть ваше ім'я:"
#read username
username="familybykov05"
CRON_JOB="
0 3 * * * /usr/bin/docker exec rozetka_clone-database-1 mysqldump -u root -p'XXXXXXXXXXXXXXXXXXX' clothes_store > /home/familybykov05/Rozetka_clone/database/backup_crontab_$(date +\%F).sql
*/10 * * * * /home/familybykov05/Rozetka_clone/Auto.sh >> /home/familybykov05/Rozetka_clone/logs/Auto_upgrade_crontab_$(date +\%F).log
0 0 * * * rm /home/familybykov05/Rozetka_clone/logs/Auto_upgrade_crontab_*.log
0 4 * * * /home/familybykov05/Rozetka_clone/log.sh
"

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

sed -i "s|#Port 22|Port 57326|" "/etc/ssh/sshd_config"
sed -i "s|#PubkeyAuthentication yes|PubkeyAuthentication yes|" "/etc/ssh/sshd_config"
sed -i "s|#PasswordAuthentication yes|PasswordAuthentication no|" "/etc/ssh/sshd_config"
sed -i "s|#PermitRootLogin|PermitRootLogin no #|" "/etc/ssh/sshd_config"
sed -i "s|#MaxAuthTries 6|MaxAuthTries 3|" "/etc/ssh/sshd_config"
sed -i "s|#MaxSessions 10|MaxSessions 2|" "/etc/ssh/sshd_config"

apt install -y iptables-persistent
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 57326 -j ACCEPT
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
iptables -L -v -n
systemctl start iptables.service
systemctl enable iptables.service
netfilter-persistent save
systemctl status iptables.service

apt install fail2ban debsecan needrestart -y

systemctl enable fail2ban
echo '[Definition]

failregex = <HOST> -.* "(GET|POST).*wp-login.php.*"
            <HOST> -.* "(GET|POST).*xmlrpc.php.*"
            <HOST> -.* "(GET|POST).*\.env.*"
            <HOST> -.* "(GET|POST).*dump.sql.*"
            <HOST> -.* "(GET|POST).*admin.php.*"
            <HOST> -.* "(GET|POST).*login.php.*"
            <HOST> -.* "(GET|POST).*setup.php.*"
            <HOST> -.* "(GET|POST).*phpmyadmin.*"
            <HOST> -.* "(GET|POST).*\.git.*"
            <HOST> -.* "(GET|POST).*config\.json.*"
            <HOST> -.* "(GET|POST).*database\.yml.*"

            <HOST> -.* "User-Agent:.*zgrab.*"
            <HOST> -.* "User-Agent:.*Keydrop.*"
            <HOST> -.* "User-Agent:.*curl.*"
            <HOST> -.* "User-Agent:.*Palo Alto.*"
            <HOST> -.* "User-Agent:.*masscan.*"
            <HOST> -.* "User-Agent:.*nikto.*"
            <HOST> -.* "User-Agent:.*sqlmap.*"
            <HOST> -.* "User-Agent:.*nmap.*"

ignoreregex =' > /etc/fail2ban/filter.d/nginx-badbots.conf
echo '[Definition]
failregex = ^<HOST> - .* "GET /.* HTTP/1.1"
            ^<HOST> - .* "POST /.* HTTP/1.1"
ignoreregex =' > /etc/fail2ban/filter.d/nginx-limit-req.conf

echo '[sshd]
enabled = true
port = 57326
filter = sshd
logpath = /var/log/auth.log
maxretry = 3
bantime = 600
action = iptables-multiport[name=SSH, port="57326", protocol=tcp]

[nginx-badbots]
enabled  = true
port     = http,https
filter   = nginx-badbots
logpath  = /var/log/nginx/access.log*
maxretry = 1
bantime  = 360000
action = iptables-multiport[name=HTTP, port="http,https", protocol=tcp]

[nginx-limit-req]
enabled = true
port = http,https
filter = nginx-limit-req
logpath = /var/log/nginx/access.log*
findtime = 60
maxretry = 750
bantime = 3600
action = iptables-multiport[name=HTTP, port="http,https", protocol=tcp]' > /etc/fail2ban/jail.local
systemctl restart fail2ban
fail2ban-client status

apt install -y certbot python3-certbot-nginx

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout ./proxy/certs/selfsigned.key \
    -out ./proxy/certs/selfsigned.crt \
    -subj "/CN=localhost"
openssl dhparam -out ./proxy/certs/dhparam.pem 4096

#certbot --nginx -d nfv.pp.ua -d www.nfv.pp.ua --config-dir ./proxy/certs/ --work-dir ./proxy/certs-work --logs-dir ./proxy/certs-logs --non-interactive --agree-tos --email andrijbikov134@gmail.com 


openssl req -newkey rsa:2048 -nodes -keyout ./database/certs/mysql-server.key \
    -x509 -days 365 -out ./database/certs/mysql-server.crt \
    -subj "/CN=localhost"
cp ./database/certs/mysql-server.crt ./database/certs/mysql-ca.pem

apt install -y apache2-utils
echo "Monitoring_grafana" | htpasswd -c -i ./proxy/.htpasswd admin
cat ./proxy/.htpasswd

chown -R ${username}:${username} ../Rozetka_clone
chmod -R 777 ./frontend/node_modules

if (crontab -l 2>/dev/null | grep -Fq "$CRON_JOB"); then
    echo "Crontab entry already exists. Продовжуємо виконання скрипта..."
else
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
    echo "Новий запис додано в crontab!"
fi

echo "END"

usermod -aG docker ${username}
newgrp docker

