#
# Cookbook:: envsetup
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

cookbook_file '/etc/selinux/config' do
  source 'selinux-config'
end

service "firewalld" do
  action [:stop, :disable]
end
