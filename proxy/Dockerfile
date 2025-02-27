# proxy/Dockerfile
FROM nginx:latest
COPY ./certs /etc/letsencrypt
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./.htpasswd /etc/nginx/.htpasswd 
COPY ./custom_404.html /usr/share/nginx/html/custom_404.html
COPY ./custom_50x.html /usr/share/nginx/html/custom_50x.html
ENV NGINX_PORT=80
EXPOSE $NGINX_PORT
CMD ["nginx", "-g", "daemon off;"]