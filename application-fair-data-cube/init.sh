#!/bin/bash

# Define the Nginx configuration file path
nginx_conf="/etc/nginx/conf.d/ssl_main.conf"

# Let Nginx serve the docker container running on port 8080 instead of a static web page
sed -i 's|root /var/www/html;|location \/ {\n    \tindex index_fdcube.html;\n } |' "$nginx_conf"
#cat app_ports.conf >> "$nginx_conf"
sed -i 's|index index.html index.htm;||' "$nginx_conf"
cat app_ports.conf >> /etc/nginx/conf.d/ssl_main.conf
systemctl restart nginx.service
