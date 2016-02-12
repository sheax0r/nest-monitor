require 'active_record'
class Event < ActiveRecord::Base
  # Whoops, maybe I shouldn't have named that column "type" after all ...
  self.inheritance_column = "inheritance_type"
end
