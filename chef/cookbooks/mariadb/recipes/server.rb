
package "Installing #{node['server_pack_name']}" do
	package_name "#{node['server_pack_name']}"
	action :install
	#version '1:5.5.52-1'
end

service "#{node['service_name']}" do
	action [ :start, :enable ]
end


