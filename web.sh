sudo apt update
sudo apt install apache2 -y
sudo apt install php libapache2-mod-php -y
sudo systemctl restart apache2
sudo mkdir /var/www/html/php-sample/
sudo git clone https://github.com/robinverstraelen/php-sample.git /var/www/html/php-sample/
sudo mv /var/www/html/php-sample/index.php /var/www/html/index.php
sudo rm -f /var/www/html/index.html
sudo rm -rf /var/www/html/php-sample/
sudo echo "%CliqrTier_Database_IP%" > /var/www/html/ip.html
sudo echo "%JOB_NAME%" > /var/www/html/job.html
#sudo echo "export test%JOB_NAME%" >> .bash_profile