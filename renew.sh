#!/bin/sh


#Enter Shell Folder
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
cd $SHELL_FOLDER

#Load Ini
source ./config.ini


#Run Command Renew Cert
docker run -i --rm \
			-v "$SHELL_FOLDER/config.ini:/certbot/config.ini" \
            -v "$SHELL_FOLDER/letsencrypt:/etc/letsencrypt" \
            -v "$SHELL_FOLDER/log:/var/log/letsencrypt" \
            certbot/dns-cloudflare:latest renew --dns-cloudflare --dns-cloudflare-credentials /certbot/config.ini 
#--dry-run


# reload nginx
docker exec -i ${nginx_container_name} nginx -s reload 