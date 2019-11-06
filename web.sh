source /usr/local/cliqr/etc/userenv
sudo apt update
sudo apt install apache2 -y --allow-unauthenticated
sudo apt install php libapache2-mod-php php-mysql -y --allow-unauthenticated
sudo sed -i "s/;extension=mysqli/extension=mysqli/g" /etc/php/7.2/apache2/php.ini
sudo systemctl restart apache2
sudo mkdir /var/www/html/php-sample/
sudo git clone https://github.com/robinverstraelen/ccc-provision.git /var/www/html/php-sample/
sudo mv /var/www/html/php-sample/src/index.php /var/www/html/index.php
sudo rm -f /var/www/html/index.html
sudo rm -rf /var/www/html/php-sample/
sudo sed -i s/%DB_TIER_IP%/$CliqrTier_Database_PUBLIC_IP/g /var/www/html/index.php

#;https://raw.githubusercontent.com/robinverstraelen/ccc-provision/master/web.sh