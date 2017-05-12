# Install and Configure Chef-Server

### 1) Install Chef-Server. Before to that Disable SELINUX and Firewall.

```
# yum install https://packages.chef.io/files/stable/chef-server/12.14.0/el/7/chef-server-core-12.14.0-1.el7.x86_64.rpm -y
# chef-server-ctl reconfigure
```

### 2) Setup admin user.
```
#chef-server-ctl user-create admin Admin User root@localhost.localdomain 'admin123' --filename /opt/admin.pem
```

### 3) Setup an Organization.

```
# chef-server-ctl org-create versionit 'VerionIT Consulting' --association_user admin --filename /opt/versionit.pem
```
### 4) Install Chef Web Interface

```
# chef-server-ctl install chef-manage
# chef-server-ctl reconfigure
# chef-manage-ctl reconfigure
```

### You can access your chef server over web browser now.
