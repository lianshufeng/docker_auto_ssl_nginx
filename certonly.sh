#!/bin/sh

#Enter Shell Folder
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
cd $SHELL_FOLDER

#Load Ini
source ./config.ini


#Run Command 
docker run -it --rm \
			-v "$SHELL_FOLDER/config.ini:/certbot/config.ini" \
            -v "$SHELL_FOLDER/letsencrypt:/etc/letsencrypt" \
            -v "$SHELL_FOLDER/log:/var/log/letsencrypt" \
            certbot/dns-cloudflare:latest  certonly --agree-tos --register-unsafely-without-email --dns-cloudflare --dns-cloudflare-credentials /certbot/config.ini --preferred-challenges dns -d ${domain}


