#!/bin/sh

#Enter Shell Folder
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
cd $SHELL_FOLDER

#Load Ini
source ./config.ini


#Run Command
sudo docker run -it  \
            -v "$SHELL_FOLDER/letsencrypt:/etc/letsencrypt" \
            -v "$SHELL_FOLDER/log:/var/log/letsencrypt" \
			-v "$webroot:/opt/web" \
            certbot/certbot certonly --agree-tos --register-unsafely-without-email --webroot -w /opt/web -d ${domain}
			


