#!/bin/bash

# Шлях до сертифікатів Let's Encrypt
LE_CERT="/etc/letsencrypt/live/nfv.pp.ua/fullchain.pem"
LE_KEY="/etc/letsencrypt/live/nfv.pp.ua/privkey.pem"


docker compose up -d --build

docker exec -it rozetka_clone-proxy-1 bash -c "certbot --nginx -d nfv.pp.ua -d www.nfv.pp.ua --non-interactive --agree-tos --email andrijbikov134@gmail.com"
sed -i "s|ssl_certificate /etc/nginx/certs/selfsigned.crt;|ssl_certificate $LE_CERT;|" "./proxy/nginx.conf"
sed -i "s|ssl_certificate_key /etc/nginx/certs/selfsigned.key;|ssl_certificate_key $LE_KEY;|" "./proxy/nginx.conf"
docker compose restart proxy
