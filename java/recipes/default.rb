#
# Cookbook Name:: java
# Recipe:: default
#
# Copyright 2015, Cosmin Rus
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.warn('java: START')

# Uncomment the line below or execute "apt-get update" into a "bash" resource if the openjdk package it's missing from repos.
#include_recipe 'apt'

# install openjdk
package  "openjdk-#{node['java']['openjdk_version']}-jre" do
  action :install
end

Chef::Log.warn('java: END')



