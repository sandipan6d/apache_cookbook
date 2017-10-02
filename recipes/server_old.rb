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

file '/var/www/html/index.html' do
  content "<h1><font color='green'>Machine Info:</font></h1>
    <p><h2>HOST: #{hostname}</h2></br>
       <h2>Private IP: #{ip_address}</h2></br>
       <h2>MEMORY: #{memory}</h2></br></p>"
end

service 'httpd' do
  action [ :enable, :start ]
end

