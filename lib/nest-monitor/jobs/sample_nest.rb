require 'nest-monitor/model/nest_status'
require 'nest_thermostat'

module NestMonitor
  module Jobs
    class SampleNest
      class << self
        def perform
          nest = NestThermostat::Nest.new(email:ENV['NEST_USER'], password: ENV['NEST_PASSWORD'])
          NestStatus.new(data: nest.status).save!
        end
      end
    end
  end
end
