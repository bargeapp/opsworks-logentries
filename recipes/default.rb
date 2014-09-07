cookbook_file '/etc/yum.repos.d/logentries.repo' do
  source 'logentries.repo'
  owner 'root'
  group 'root'
  mode 0644
end

execute "yum update"
execute "yum install logentries -y"
execute "le register --user-key #{node[:logentries][:userkey]} --name='#{node[:logentries][:hostname]}'"
execute "yum install logentries-daemon -y"