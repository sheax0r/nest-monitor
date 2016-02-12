require 'active_record'
module NestMonitor
  module Initializers
    db = URI.parse(ENV.fetch('DATABASE_URL'))
    pool = ENV["DB_POOL"] || ENV['MAX_THREADS'] || 5
    ActiveRecord::Base.establish_connection(
      adapter:  db.scheme == 'postgres' ? 'postgresql' : db.scheme,
      host:      db.host,
      username:  db.user,
      password:  db.password,
      database:  db.path[1..-1],
      encoding:  'utf8',
      pool:      pool
    )
  end
end

