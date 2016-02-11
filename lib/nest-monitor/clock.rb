require 'clockwork'
require' jobs'

module Clockwork
  handler do |job|
    job.perform_async
  end

  every(60.minutes, RestartNest)
  every(5.minutes, SampleNest)
end
