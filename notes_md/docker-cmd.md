 systemctl --user start docker-desktop
 
 docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root@asus -d mysql
