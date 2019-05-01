# Recipe to install and manage cadvisor service

cookbook_file '/usr/local/bin/cadvisor' do
  source 'cadvisor/cadvisor-v0.33.0'
  mode '0755'
  action :create
end

systemd_unit 'cadvisor.service' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=Analyzes resource usage and performance characteristics of running containers
  After=local-fs.target network-online.target network.target
  Wants=local-fs.target network-online.target network.target
  
  [Service]
  ExecStart=/usr/local/bin/cadvisor
  Type=simple
  Restart=on-failure
  
  [Install]
  WantedBy=multi-user.target  
  EOU
action [ :create, :enable, :start]
verify false
end

service 'cadvisor' do
  subscribes :restart, 'file[/usr/local/bin/cadvisor]', :immediately
end
