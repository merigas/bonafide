#!/bin/bash

if [ "$1" = "bash" ]; then bash;exit ;fi
mysqld_safe &
sleep 5
until netstat -lntp 2>/dev/null |grep 3306; do 
	sleep 5
done
mysql -u root <<EOF
use test;
CREATE TABLE Students(student_id INT NOT NULL AUTO_INCREMENT,
	student_name VARCHAR(100) NOT NULL,
        student_addr VARCHAR(100) NOT NULL,
	student_age VARCHAR(3) NOT NULL,
	student_qual VARCHAR(20) NOT NULL,
	student_percent VARCHAR(10) NOT NULL,
	student_year_passed VARCHAR(10) NOT NULL,
	PRIMARY KEY (student_id)
);
use mysql;
UPDATE user SET password=PASSWORD("root") WHERE User='root';
GRANT ALL PRIVILEGES ON test.* TO 'root'@'%' IDENTIFIED by 'root';
FLUSH PRIVILEGES;
EOF
kill -9 `ps -ef |grep mysql |grep -v grep |awk '{print $2}'`
exec mysqld_safe
