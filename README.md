# wp-docker
A great shell script to help you deploy wordpress necessary infraustructure on any kink of ubunutu server.
Getting a lemp stack working on a server can be very time eating and hard to get it work perfectly. that's why I created this to help expert Wordpress users so you could easily get a one click Wordpress server deployment.
This shell is based on Docker.
This shell script will install and configure following components automatically:
Docker,
Mysql,
Nginx,
Let's encrypt SSL,

>> Requirments:
- ubuntu server 20.04 or 18.04
- A record of your domain with the value of www.example.com to your server ip
- A record of your domain with the value of example.com to your server ip

>> Video Tutorial (SOON)


>> How to install:
wget https://raw.githubusercontent.com/garousiamir/wp-docker/main/wp-docker.sh 
chmod 777 wp-docker.sh
sed -i "s/example.com/YOURDOMAIN/g" wp-docker.sh
(instead of YOURDOMAIN you must put your own domain without www or http or https)
./wp-docker.sh
