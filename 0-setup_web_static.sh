#!/usr/bin/env bash
#update and install nginx

echo "update and install Nginx..."
apt-get update -y
apt-get install nginx -y

echo "creating directories...."
mkdir -p /data/
mkdir -p /data/web_static/
mkdir -p /data/web_static/releases/
mkdir -p /data/web_static/shared/
mkdir -p /data/web_static/releases/test/

echo "creating html file..."
mkdir -p /data/web_static/releases/test/index.html
echo "<html>
<head>
</head>
<body>
Holberton School
</body>
</html>" > /data/web_static/releases/test/index.html

echo "creating symbolic link....."
ln -sfn /data/web_static/relseases/test/ /data/web_static/current

echo "giving permissions..."
chown -R ubuntu:ubuntu /data/

echo "updating nginx config to serve content..."
sed -i '/server_name _;/a \\tlocation /hbnb_static {\n\t\talias /data/web_static/current;\n\t}' /etc/nginx/sites-available/default

echo "Restarting Nginx..."
service nginx restart
