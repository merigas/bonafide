## Install Dependencies of Web Server

%w(apr-devel gcc apr-util-devel pcre-devel mailcap).each do |pack_name|
	package "#{pack_name}"
end

## Download source.

remote_file '/opt/httpd-2.4.25.tar.gz' do
  source 'http://mirror.fibergrid.in/apache//httpd/httpd-2.4.25.tar.gz'
  action :create
end

execute 'httpd extract' do 
	command 'tar -xzf httpd-2.4.25.tar.gz'
	cwd '/opt'
end

execute 'configure httpd' do 
	command './configure --prefix=/d01/apache'
	cwd '/opt/httpd-2.4.25'
end

execute 'Running make clean' do
        command 'make clean'
        cwd '/opt/httpd-2.4.25'
end

execute 'Running make ' do
        command 'make'
        cwd '/opt/httpd-2.4.25'
end

execute 'Running make install' do
        command 'make install'
        cwd '/opt/httpd-2.4.25'
end

execute 'start web server' do 
	command '/d01/apache/bin/apachectl start'
end


include_recipe 'httpd::config'









