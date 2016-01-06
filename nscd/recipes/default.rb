#
# Cookbook Name:: nscd
# Recipe:: default
#
# Copyright 2015, Team
#
# All rights reserved - Do Not Redistribute
#

ruby_block 'start' do
  block do
    Chef::Log.warn('nscd  START')
  end
end

package 'nscd' do
  action :install
end

service 'nscd' do
  action :enable
  supports :status => true, :start => true, :stop => true, :restart => true, :enable => true
end

template '/etc/nscd.conf' do
  source 'nscd.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
      :passwd_cache  => node[:nscd][:passwd_cache],
      :group_cache   => node[:nscd][:group_cache],
      :positive_ttl  => node[:nscd][:positive_ttl],
      :negative_ttl  => node[:nscd][:negative_ttl],
      :service_cache => node[:nscd][:service_cache]
  )
  notifies :restart, 'service[nscd]'
end

ruby_block 'stop' do
  block do
    Chef::Log.warn('nscd  END')
  end
end
