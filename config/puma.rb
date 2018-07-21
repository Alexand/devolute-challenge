# config/puma.rb
workers Integer(ENV["WEB_CONCURRENCY"] || ENV["RACK_ENV"] == "development" ? 1 : 2)
threads_count = Integer(ENV['PADRINO_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_restart do
  puts "Restarting..."
  ::Sequel::Model.db.disconnect if defined?(::Sequel) && defined?(::Sequel::Model)
end

before_fork do
  puts "Starting workers..."
  ::Sequel::Model.db.disconnect if defined?(::Sequel) && defined?(::Sequel::Model)
end

prune_bundler

worker_timeout Integer(ENV["WORKER_TIMEOUT"] || 60)

worker_boot_timeout Integer(ENV["WORKER_BOOT_TIMEOUT"] || ENV["WORKER_TIMEOUT"] || 60)
