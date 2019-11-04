source /usr/local/cliqr/etc/userenv
sudo yum -y update
sudo yum -y install wget
wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
sudo rpm -ivh mysql80-community-release-el7-3.noarch.rpm
sudo yum -y install mysql-server
sudo systemctl start mysqld
temp_password=$(sudo grep password /var/log/mysqld.log | awk '{print $NF}')
sudo mkdir -p /var/mysql/
sudo echo $(sudo grep password /var/log/mysqld.log | awk '{print $NF}') | sudo tee /home/cliqruser/pass > /dev/null
sudo echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('C1sco123&');" | sudo tee /home/cliqruser/reset_pass.sql > /dev/null
sudo echo "GRANT ALL PRIVILEGES ON *.* TO 'appuser'@'%' IDENTIFIED BY 'C1sco123&';" | sudo tee /home/cliqruser/newuser.sql > /dev/null
#sudo echo "flush privileges;" | sudo tee /home/cliqruser/reset_pass.sql > /dev/null
mysql -u root --password="$temp_password" --connect-expired-password < /home/cliqruser/newuser.sql


#;https://raw.githubusercontent.com/robinverstraelen/ccc-provision/master/mysql.sh
#sudo bash <(curl -s https://raw.githubusercontent.com/robinverstraelen/ccc-provision/master/mysql.sh)