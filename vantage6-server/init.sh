#!/bin/bash

# Define the Nginx configuration file path
nginx_conf="/etc/nginx/conf.d/ssl_main.conf"

# Let Nginx serve the docker container running on port 8000 instead of a static web page
sed -i 's|root /var/www/html;|location \/ {\n    \tproxy_pass http:\/\/localhost:8000;\n    \tproxy_set_header Host $host;\n    \tproxy_set_header X-Real-IP $remote_addr;\n    }\n location \/socket.io {\n    \tinclude proxy_params;\n    \tproxy_http_version 1.1;\n    \tproxy_buffering off;\n    \tproxy_set_header Upgrade $http_upgrade;\n    \tproxy_set_header Connection "Upgrade";\n    \tproxy_pass http:\/\/127.0.0.1:5000\/socket.io;\n    }|' "$nginx_conf"
sed -i 's|index index.html index.htm;||' "$nginx_conf"

systemctl restart nginx.service
