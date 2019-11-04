source /usr/local/cliqr/etc/userenv

# install software
sudo yum -y update
sudo yum -y install wget
sudo yum -y install git
wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
sudo rpm -ivh mysql80-community-release-el7-3.noarch.rpm
sudo yum -y install mysql-server
sudo systemctl start mysqld

# get mysql temp pwd
temp_password=$(sudo grep password /var/log/mysqld.log | awk '{print $NF}')

# create & execute query for new user
sudo echo "SET PASSWORD FOR 'appuser'@'%' = PASSWORD('C1sco123&');" | sudo tee /home/cliqruser/changepass.sql > /dev/null
sudo echo "GRANT ALL PRIVILEGES ON *.* TO 'appuser'@'%' IDENTIFIED BY 'C1sco123&';" | sudo tee /home/cliqruser/newuser.sql > /dev/null
mysql -u root --password="$temp_password" --connect-expired-password < /home/cliqruser/newuser.sql
mysql -u root --password="$temp_password" --connect-expired-password < /home/cliqruser/changepass.sql

# populate database
mkdir -p /home/cliqruser/db
git clone https://github.com/datacharmer/test_db.git /home/cliqruser/db
mysql -u root --password="$temp_password" --connect-expired-password < /home/cliqruser/db/employees.sql
#;https://raw.githubusercontent.com/robinverstraelen/ccc-provision/master/mysql.sh
#sudo bash <(curl -s https://raw.githubusercontent.com/robinverstraelen/ccc-provision/master/mysql.sh)