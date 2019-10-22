sudo apt update
sudo apt install apache2 -y
sudo apt install php libapache2-mod-php -y
sudo systemctl restart apache2
sudo mkdir /var/www/html/php-sample/
sudo git clone https://github.com/robinverstraelen/php-sample.git /var/www/html/php-sample/
#sudo mv /var/www/html/php-sample/index.php /var/www/html/index.php