# Recipe to install and manage docker service

sysctl 'net.ipv4.conf.all.forwarding' do
  value '1'
  action :apply
end

yum_repository 'docker-ce-stable' do
  baseurl   'https://download.docker.com/linux/centos/7/$basearch/stable'
  enabled   true
  gpgcheck  true
  gpgkey    'https://download.docker.com/linux/centos/gpg'
  action    :create
end

yum_package 'docker-ce' do
  action :install
end

service 'docker' do
  action [ :enable, :start ]
end

docker_network 'net1' do
  action :create
end