# Recipe to install and manage node_exporter service

cookbook_file '/usr/local/bin/node_exporter' do
  source 'node_exporter/node_exporter-0.17.0.linux-amd64'
  mode '0755'
  action :create
end

systemd_unit 'node_exporter.service' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=Prometheus node exporter
  After=local-fs.target network-online.target network.target
  Wants=local-fs.target network-online.target network.target
  
  [Service]
  ExecStart=/usr/local/bin/node_exporter
  Type=simple
  Restart=on-failure
  
  [Install]
  WantedBy=multi-user.target  
  EOU
action [ :create, :enable, :start]
verify false
end

service 'node_exporter' do
  subscribes :restart, 'file[/usr/local/bin/node_exporter]', :immediately
end
