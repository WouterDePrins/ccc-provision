source /usr/local/cliqr/etc/userenv
sudo yum update
wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
sudo rpm -ivh mysql80-community-release-el7-3.noarch.rpm
sudo yum install mysql-server
sudo systemctl start mysqld
temp_password=$(grep password /var/log/mysqld.log | awk '{print $NF}')
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'C1sco123!'; flush privileges;" > reset_pass.sql
mysql -u root --password="$temp_password" --connect-expired-password < reset_pass.sql

#;https://raw.githubusercontent.com/robinverstraelen/ccc-provision/master/mysql.sh