#!/bin/sh


#Enter Shell Folder
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
cd $SHELL_FOLDER

#Load Ini
source ./config.ini


#Run Command Renew Cert
docker run -i --rm \
            -v "$SHELL_FOLDER/letsencrypt:/etc/letsencrypt" \
            -v "$SHELL_FOLDER/log:/var/log/letsencrypt" \
			-v "$webroot:/opt/web" \
            certbot/dns-cloudflare:latest renew --webroot -w /opt/web 
#--dry-run


# reload nginx
docker exec -i ${nginx_container_name} nginx -s reload 