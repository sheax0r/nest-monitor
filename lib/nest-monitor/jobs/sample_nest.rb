require 'nest-monitor/model/nest_status'
require 'nest_thermostat'
require 'json'
require 'sucker_punch'

module NestMonitor
  module Jobs
    class SampleNest
      include SuckerPunch::Job
      def perform
        nest = NestThermostat::Nest.new(email:ENV['NEST_USER'], password: ENV['NEST_PASSWORD'])
        NestStatus.new(data: nest.status.to_json).save!
      end
    end
  end
end
