#
# Cookbook Name:: java
# Recipe:: oracle-java
#
# Copyright 2015, Cosmin Rus
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.warn('java: START')

include_recipe 'apt'

# Add oracle-java ppa repo
apt_repository 'oracle-java' do
  uri 'ppa:webupd8team/java'
  distribution node['lsb']['codename']
end

# accept-oracle-license
bash 'accepted-oracle-license' do
  user 'root'
  code <<-EOH
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
  EOH
end

# install java
package "oracle-java#{node[:java][:oracle_version]}-installer" do
  action :install
end

# install "set-default-java"
package "oracle-java#{node[:java][:oracle_version]}-set-default" do
  action :install
end

Chef::Log.warn('java: END')
