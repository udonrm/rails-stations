# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# every 1.day, at: '7:00 pm' do
#     rake "reminder:send_email"
# end

set :output, 'log/cron.log'
set :environment, 'development'

env :PATH, ENV.fetch('PATH', nil)
env :GEM_HOME, ENV.fetch('GEM_HOME', nil)

every 1.day, at: '7:00 pm' do
    runner 'Reservation.reminder_email'
end

every 1.day, at: '0:00 am' do
    runner 'Reservation.calculate_ranking'
end

# every 1.minutes do
#     runner "Reservation.calculate_ranking"
# end
