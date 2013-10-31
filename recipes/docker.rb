include_recipe 'apt'

apt_repository 'dotcloud' do
  key node['deis']['docker']['key_url']
  uri node['deis']['docker']['deb_url']
  distribution 'docker'
  components ['main']
end

package 'lxc-docker-0.6.4'

service 'docker' do
  provider Chef::Provider::Service::Upstart  
  supports :status => true, :restart => true, :reload => true
  action [ :enable ]
end
