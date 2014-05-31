root = "#{Dir.getwd}"

rackup "#{root}/config.ru"

environment "development"

daemonize false

# bind "unix:///#{root}/tmp/sockets/puma_socket"
bind 'tcp://0.0.0.0:3000'
pidfile "#{root}/tmp/pids/puma_pid"
state_path "#{root}/tmp/pids/puma_state"

threads 0, 5
workers 3

on_worker_boot do
  if defined?(ActiveSupport)
    ActiveSupport.on_load(:active_record) do
      ActiveRecord::Base.establish_connection
    end
  end
end