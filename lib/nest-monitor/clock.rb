$: << File.join(File.dirname(__FILE__), '..', '..')
require 'clockwork'
require 'nest-monitor/jobs'

module Clockwork
  handler do |job|
    job.perform_async
  end

  # Currently, just force a restart every hour. We'll switch to
  # conditional restarting when it's ready.
  #every(15.minutes, NestMonitor::Jobs::EvaluateRestart)
  every(60.minutes, NestMonitor::Jobs::RestartNest)

  every(5.minutes,  NestMonitor::Jobs::SampleNest)
end
