#
# Cookbook Name:: fix-openstack-local-ipv4
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/opt/chef/embedded/lib/ruby/gems/1.9.1/gems/ohai-6.20.0/lib/ohai/mixin/ec2_metadata.rb" do
  source "ec2_metadata.rb"
  owner "root"
  group "root"
  mode "0644"
end

