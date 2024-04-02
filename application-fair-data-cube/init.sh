#!/bin/bash

# Define the Nginx configuration file path
nginx_conf="/etc/nginx/conf.d/ssl_main.conf"

# Let Nginx serve the docker container running on port 8080 instead of a static web page
# sed -i 's|root /var/www/html;|location \/ {\n    \tproxy_pass http:\/\/127.0.0.1:7200;\n    \tproxy_set_header Host $host;\n    \tproxy_set_header X-Real-IP $remote_addr;\n    } \n    location ~ \/fairdatapoint(\/.*)?$ {\n  \trewrite \/fairdatapoint(\/.*) $1 break;\n    \trewrite \/fairdatapoint \/ break;\n    \tproxy_pass http:\/\/127.0.0.1:8080;\n    \tproxy_set_header Host $host;\n    \tproxy_set_header X-Real-IP $remote_addr;\n   \tproxy_pass_request_headers on;\n  } |' "$nginx_conf"
sed -i 's|root /var/www/html;|location \/ {\n    \tindex index_fdcube.html;\n } |' "$nginx_conf"
#cat app_ports.conf >> "$nginx_conf"
sed -i 's|index index.html index.htm;||' "$nginx_conf"
cat app_ports.conf >> /etc/nginx/conf.d/ssl_main.conf
systemctl restart nginx.service
