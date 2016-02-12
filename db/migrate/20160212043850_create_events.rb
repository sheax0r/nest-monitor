class CreateEvents < ActiveRecord::Migration
  def self. up
    create_table :events, force: true do |t|
      t.string :type
      t.timestamps
    end
  end
end
