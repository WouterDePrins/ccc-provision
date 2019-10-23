sudo apt update
sudo apt install apache2 -y
sudo apt install php libapache2-mod-php -y
sudo systemctl restart apache2
sudo mkdir /var/www/html/php-sample/
sudo git clone https://github.com/robinverstraelen/php-sample.git /var/www/html/php-sample/
sudo mv /var/www/html/php-sample/index.php /var/www/html/index.php
sudo rm -f /var/www/html/index.html
sudo rm -rf /var/www/html/php-sample/
#sudo bash -c 'echo %CliqrTier_Database_IP% >> /var/www/html/index.html'
#sudo bash -c 'echo %JOB_NAME% >> /var/www/html/index.html'
#echo %JOB_NAME% > /home/cliqruser/job.txt
#echo %CliqrTier_Database_IP% > /home/cliqruser/ip.txt
#sudo echo "export test%JOB_NAME%" >> .bash_profile

#;https://raw.githubusercontent.com/robinverstraelen/ccc-provision/master/web.sh