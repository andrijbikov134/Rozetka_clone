# proxy/Dockerfile
FROM nginx:latest
COPY ./certs /etc/nginx/certs
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./.htpasswd /etc/nginx/.htpasswd 
COPY ./custom_404.html /usr/share/nginx/html/custom_404.html
COPY ./custom_50x.html /usr/share/nginx/html/custom_50x.html
RUN apt-get update && apt-get install -y certbot python3-certbot-nginx
RUN certbot --nginx -d nfv.pp.ua -d www.nfv.pp.ua --non-interactive --agree-tos --email andrijbikov134@gmail.com 
ENV NGINX_PORT=80
EXPOSE $NGINX_PORT
CMD ["nginx", "-g", "daemon off;"]