require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

# scheduler.every("10s") do
  # puts "Starting job"
  # Transit.fetch_minutes
# end

scheduler.every("30s") do
  puts "Starting job"
  Transit.fetch_minutes
end
