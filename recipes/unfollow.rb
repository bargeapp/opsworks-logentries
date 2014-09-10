node[:deploy].each do |application, deploy|
  logs = node[:logentries][application][:files]
  logs.each do |log|
    execute "le rm '#{log}'"
  end
end

# Start the service
execute "service logentries restart"