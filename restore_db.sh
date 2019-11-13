mkdir -p /home/cliqruser/dbmigrate
git clone https://github.com/robinverstraelen/ccc-provision.git /home/cliqruser/dbmigrate
sed -i '1 i\use employees;' /home/cliqruser/dbmigrate/dump.sql
mysql -u root --password="" < /home/cliqruser/dbmigrate/dump.sql