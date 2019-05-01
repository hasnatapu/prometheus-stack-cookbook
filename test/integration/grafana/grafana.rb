describe port(3000) do
  it { should be_listening }
end

describe command('curl -XGET -s http://localhost:3000/api/health') do
  its('stdout') { should match (/.*ok.*/) }
end