#
# Cookbook Name:: configure-clearwater-dns
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

s = "chef_environment:#{node.chef_environment} AND roles:clearwater-infrastructure"
nodes = search(:node, s)

role_to_name = Hash[%w(sprout homer ellis ralf memento).map{|name| [name, name]}]
role_to_name['homestead'] = 'hs'
role_to_name['bono'] = '@'

records = []
role_to_name.each_pair do |role, name|
    nodes.select {|node| node.roles.include?(role)}.each do |node|
        records << {
            'name' => name,
            'node' => node
        }
        # puts("ROLE #{role} NAME #{name} NODE #{node}")
    end
end
records.sort_by! { |r| r['name'] }

# puts("RECORDS: #{records}")
["internal", "external"].each do |location|
    template "/var/cache/bind/zones/#{location}" do
        source "#{location}.erb"
        variables({
            :nodes => nodes,
            :records => records
        })
        notifies :restart, "service[bind9]"
    end
end

service "bind9" do
    action :nothing
end
