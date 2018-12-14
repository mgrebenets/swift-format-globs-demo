puts "Running glob for #{ARGV[0]}"
list = Dir[ARGV[0]]
puts "Matches: #{list.length}"
