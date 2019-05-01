describe port(8080) do
  it { should be_listening }
end

describe service('cadvisor') do
  it { should be_enabled }
  it { should be_running }
end