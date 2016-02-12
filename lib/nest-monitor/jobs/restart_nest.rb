require 'nest_thermostat'
require 'sucker_punch'

module NestMonitor
  module Jobs
    class RestartNest
      include SuckerPunch::Job
      def perform
        nest = NestThermostat::Nest.new(email:ENV['NEST_USER'], password: ENV['NEST_PASSWORD'])
        target = nest.temp
        nest.temp = nest.current_temp - 2
        sleep(30)
        nest.temp = target 
      end
    end
  end
end
