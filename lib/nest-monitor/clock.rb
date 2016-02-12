$: << File.join(File.dirname(__FILE__), '..', '..')
require 'clockwork'
require 'nest-monitor/jobs'

module Clockwork
  handler do |job|
    job.perform_async
  end

  every(60.minutes, NestMonitor::Jobs::RestartNest)
  every(5.minutes,  NestMonitor::Jobs::SampleNest)
end
