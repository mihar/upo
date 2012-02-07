class CreateVisitsOfEvents < ActiveRecord::Migration
  def self.up
    create_table :visits_of_events do |t|
    	t.column :description, :text
    end
  end

  def self.down
    drop_table :visits_of_events
  end
end
