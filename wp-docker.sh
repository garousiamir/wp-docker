#!/bin/bash
echo "Wordpress One click Infraustructure Deployment Created By AmirHossein Garousi"
apt update && apt upgrade -y 
apt install nano -y
apt install unzip -y
apt install docker.io -y 
apt install docker-compose -y 
cd /home
mkdir wordpress
cd wordpress
mkdir nginx-conf 
cd nginx-conf
wget http://udemy4geeks.online/wpsh/1st-nginx/nginx.zip
unzip nginx.zip
sed -i "s/example.com/myudemy.xyz/g" nginx.conf
cd /home/wordpress
wget http://udemy4geeks.online/wpsh/1st-docker/docker-compose.yml
wget http://udemy4geeks.online/wpsh/1st-docker/env.txt
mv /home/wordpress/env.txt /home/wordpress/.env
cd /home/wordpress
sed -i "s/example.com/myudemy.xyz/g" docker-compose.yml
docker-compose up -d
sed -i 's/--staging/--force-renewal/g' docker-compose.yml
docker-compose up --force-recreate --no-deps certbot
docker-compose stop webserver
curl -sSLo nginx-conf/options-ssl-nginx.conf https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf
rm -rf /home/wordpress/nginx-conf/nginx.conf
cd /home/wordpress/nginx-conf
wget http://udemy4geeks.online/wpsh/2nd-nginx/nginx.zip
unzip nginx.zip
sed -i "s/example.com/myudemy.xyz/g" nginx.conf
cd /home/wordpress
rm -rf docker-compose.yml
wget http://udemy4geeks.online/wpsh/2nd-docker/docker-compose.yml
sed -i "s/example.com/myudemy.xyz/g" docker-compose.yml
sed -i 's/--staging/--force-renewal/g' docker-compose.yml
docker-compose up -d --force-recreate --no-deps webserver
echo "Congrats! You can Now Access your WORDPRESS on your domain"
