#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2017, The Authors, All Rights Reserved.

ip_address = node['ipaddress']
memory = node['memory']['total']
hostname = node['hostname']



package 'httpd' do
  action :install
end

template '/var/www/html/index.html' do
  source 'apache.erb'
  variables(
    :name => 'apache',
    :ip_address => "#{ip_address}",
    :memory => "#{memory}",
    :hostname => "#{hostname}"
  )
  action :create
end

service 'httpd' do
  action [ :enable, :start ]
end

