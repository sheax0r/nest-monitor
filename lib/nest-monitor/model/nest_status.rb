require 'json'
require 'active_record'
class NestStatus < ActiveRecord::Base

  def json_data
    JSON.parse(data)
  end
end
