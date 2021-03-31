#!/bin/sh


#Enter Shell Folder
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
cd $SHELL_FOLDER

#Load Ini
source ./config.ini



# install crontabs
yum install -y crontabs 
service crond start
chkconfig crond on

# set crontabs 
renew_file=$SHELL_FOLDER/renew.sh
chmod 777 ${renew_file}
if [ `grep -c "${renew_file}" /etc/crontab` -eq '0' ] ;then
	echo "0 1 * * * root ${renew_file}" >> /etc/crontab
fi