node[:deploy].each do |application, deploy|
  logs = node[:logentries][application][:files]
  logs.each do |log|
    execute "le follow '#{log}'"
  end
end

# Start the service
execute "service logentries restart"