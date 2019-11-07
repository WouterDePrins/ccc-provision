git config --global user.name "robinverstraelen"
git config --global user.password "6KxsLYShiGxc"
mkdir -p /home/cliqruser/dbmigrate
git clone https://github.com/robinverstraelen/ccc-provision.git /home/cliqruser/dbmigrate
echo "delete from employees.employees where emp_no>11000" > /home/cliqruser/delete.sql
mysql -u root --password="" < /home/cliqruser/delete.sql
mysqldump -u root --password="" employees > /home/cliqruser/dbmigrate/dump.sql
cd /home/cliqruser/dbmigrate/
git add --all
git commit -m "add dump"
git push