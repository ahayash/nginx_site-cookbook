require 'serverspec'
#include Serverspec::Helper::Exec
#include Serverspec::Helper::DetectOS

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe file('/etc/nginx/nginx.conf') do
  it { should be_file }
  its(:content) { should match(/server_name webserver\.vagrant;/) }
end
