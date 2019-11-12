mkdir -p /home/cliqruser/dbmigrate
git clone https://github.com/robinverstraelen/ccc-provision.git /home/cliqruser/dbmigrate
mysql -u root --password="" < /home/cliqruser/dbmigrate/dump.sql