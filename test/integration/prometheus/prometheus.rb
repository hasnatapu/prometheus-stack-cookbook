describe port(9090) do
  it { should be_listening }
end

describe command('curl -XGET -s http://localhost:9090/-/healthy') do
  its('stdout') { should eq "Prometheus is Healthy.\n" }
end