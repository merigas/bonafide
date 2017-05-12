#  Chef-Solo Documentation.

## Refering the cookbook from following location
`https://github.com/versionit/chef-solo-sample/archive/master.zip`

### 1) Install Chef-Solo which comes with chef-client.

#### URL : `https://downloads.chef.io/chef` 
#### URL of Package `https://packages.chef.io/files/stable/chef/13.0.118/el/7/chef-13.0.118-1.el7.x86_64.rpm`
Install the package.

```
# yum install https://packages.chef.io/files/stable/chef/13.0.118/el/7/chef-13.0.118-1.el7.x86_64.rpm -y
# chef-solo --help
```

### 2) Download cookbooks and apply them.

```
# cd /root
# wget https://github.com/versionit/chef-solo-sample/archive/master.zip
# unzip master.zip
# mv chef-solo-sample-master cookbooks
# cd cookbooks
# vi solo.rb
cookbook_path ['/root/cookbooks']

# chef-solo -c solo.rb -o recipe[httpd]
```



