source /usr/local/cliqr/etc/userenv
yum -y update
yum -y install wget
wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
rpm -ivh mysql80-community-release-el7-3.noarch.rpm
yum -y install mysql-server
systemctl start mysqld
temp_password=$(sudo grep password /var/log/mysqld.log | awk '{print $NF}')
mkdir -p /var/mysql/
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'C1sco123&'; flush privileges;" > /var/mysql/reset_pass.sql
mysql -u root --password="$temp_password" --connect-expired-password < /var/mysql/reset_pass.sql

#;https://raw.githubusercontent.com/robinverstraelen/ccc-provision/master/mysql.sh
#sudo bash <(curl -s https://raw.githubusercontent.com/robinverstraelen/ccc-provision/master/mysql.sh)