logs = node[:logentries][:files]
logs.each do |log|
  execute "le rm '#{log}'"
end

# Start the service
execute "service logentries restart"