max_threads_count = ENV.fetch("RAILS_MAX_THREADS", 5)
min_threads_count = ENV.fetch("RAILS_MIN_THREADS", max_threads_count)
threads min_threads_count, max_threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
port ENV.fetch("PORT", 3000)

# Specifies the `pidfile` that Puma will use.
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Specifies that the worker count should equal the number of processors in production.
if ENV["RAILS_ENV"] == "production"
  require "concurrent-ruby"
  worker_count = Integer(ENV.fetch("WEB_CONCURRENCY") { Concurrent.physical_processor_count })
  workers worker_count if worker_count > 1

  preload_app!
  worker_timeout 60

  on_worker_boot do
    ActiveSupport.on_load(:active_record) do
      ActiveRecord::Base.establish_connection
    end
  end
else
  environment ENV.fetch("RAILS_ENV") { "development" }

  worker_timeout 3600
  plugin :tmp_restart
end
