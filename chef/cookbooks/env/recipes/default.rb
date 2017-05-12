#
# Cookbook:: env
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'httpd' do 
	action :install
end

package 'httpd-devel' do
	action :install
end
