source /usr/local/cliqr/etc/userenv
sudo yum -y update
sudo yum -y install wget
wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
sudo rpm -ivh mysql80-community-release-el7-3.noarch.rpm
sudo yum -y install mysql-server
sudo systemctl start mysqld
sudo mkdir /var/mysql
temp_password=$(sudo grep password /var/log/mysqld.log | awk '{print $NF}')
sudo echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'C1sco123&'; flush privileges;" > /var/mysql/reset_pass.sql
sudo mysql -u root --password="$temp_password" --connect-expired-password < /var/mysql/reset_pass.sql

#;https://raw.githubusercontent.com/robinverstraelen/ccc-provision/master/mysql.sh