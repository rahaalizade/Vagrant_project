#! /bin/bash

##### CREATE MYSQL USER #####

PASSWORD={{ pillar['user']['password'] }}
USERNAME={{ pillar['user']['username'] }}
rootpasswd={{ pillar['root']['root_password'] }}

if [ -f /root/.my.cnf ]; then
    mysql -e "CREATE USER ${USERNAME}@localhost IDENTIFIED BY '${PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${USERNAME}'@'localhost';"
#    mysql -e "FLUSH PRIVILEGES;"

else
    mysql -u root -p${rootpasswd} -e "CREATE USER ${USERNAME}@localhost IDENTIFIED BY '${PASSWORD}';"
    mysql -u root -p${rootpasswd} -e "GRANT ALL PRIVILEGES ON *.* TO '${USERNAME}'@'localhost';"
fi
