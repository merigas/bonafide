FROM centos
RUN yum  install mariadb-server net-tools -y
RUN mysql_install_db
RUN chown mysql:mysql -R /var/lib/mysql  
EXPOSE 3306
ADD docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD mysqld_safe
