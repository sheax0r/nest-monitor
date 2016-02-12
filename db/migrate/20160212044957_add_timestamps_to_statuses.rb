class AddTimestampsToStatuses < ActiveRecord::Migration
  def self.up
    add_column(:nest_statuses, :created_at, :datetime)
    add_column(:nest_statuses, :updated_at, :datetime)
  end
end
