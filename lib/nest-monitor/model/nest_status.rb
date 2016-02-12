require 'json'
require 'active_record'
class NestStatus < ActiveRecord::Base

  def json_data
    @json_data ||= JSON.parse(data)
  end

  def thermostat_data
    # There can be more than one thermostat, but not in my house.
    json_data['shared'].values.first
  end

  def temperature
    thermostat_data['current_temperature']
  end

  def target_temperature
    thermostat_data['target_temperature']
  end

end
