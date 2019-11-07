mkdir -p /home/cliqruser/dbmigrate
git clone https://github.com/robinverstraelen/ccc-provision.git /home/cliqruser/dbmigrate
mysql -u appuser --password="C1sco123&" < /home/cliqruser/dbmigrate/dump.sql