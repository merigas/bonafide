#
# Cookbook:: sample
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

file '/opt/sample' do
  content '<html>This is a placeholder for the home page.</html>'
  mode '0644'
  owner 'admin'
  group 'bin'
end

include_recipe 'sample::demo'
