node[:deploy].each do |application, deploy|
  logs = node[:logentries][application][:files]
  logs.each do |log|
    execute "Logentries Follow '#{log}'" do
      command "le follow '#{log}'"
      only_if { ::File.exists?("#{log}") }
    end
  end
end

# Start the service
execute "service logentries restart"