require 'sinatra'
require 'sinatra/activerecord'

module NestMonitor
  class App < Sinatra::Base
    register Sinatra::ActiveRecordExtension
  end
end
