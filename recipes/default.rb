cookbook_file '/etc/ssl/certs/logentries.all.crt' do
  source 'logentries.all.crt'
  owner 'root'
  group 'root'
  mode 0644
end

execute "yum -y install rsyslog-gnutls"

node[:deploy].each do |application, deploy|
  settings = node[:logentries][application]
  template "/etc/rsyslog.d/logentries.conf" do
    mode '0644'
    owner 'root'
    group 'root'
    source "logentries.conf.erb"
    variables(
      token: settings[:token], 
      poll_seconds: (settings[:poll_seconds] || 10),
      facility: (settings[:facility] || 'local6'),
      files: settings[:files],
    )
  end
end

execute "Restart rsyslog" do
  command "/etc/init.d/rsyslog restart"
end