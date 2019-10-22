sudo apt update
sudo apt install apache2 -y
sudo apt install php libapache2-mod-php -y
sudo systemctl restart apache2
git clone https://github.com/robinverstraelen/php-sample.git
sudo rm /var/www/html/index.html
#sudo mv php-sample/index.php /var/www/html/index.php