## Install Dependencies of Web Server

%w(apr-devel gcc apr-util-devel pcre-devel mailcap).each do |pack_name|
	package "#{pack_name}"
end

## Download source.

remote_file '/opt/httpd-2.4.25.tar.gz' do
  source 'http://mirror.fibergrid.in/apache//httpd/httpd-2.4.25.tar.gz'
  action :create
end


compile_httpd do
	loca "/d01/apache2"
end
execute 'start web server' do 
	command '/d01/apache/bin/apachectl start'
end

