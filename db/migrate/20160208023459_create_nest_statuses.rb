class CreateNestStatuses < ActiveRecord::Migration
  def self.up
    create_table :nest_statuses, force: true do |t|
      t.text :data
    end
  end
end
