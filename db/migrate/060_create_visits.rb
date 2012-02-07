class CreateVisits < ActiveRecord::Migration
  def self.up
    create_table :visits do |t|
    	t.column "ip", :string, :limit => 50, :default => "", :null => false
			t.column "created_on", :timestamp, :null => false
			t.column "browser_agent", :string, :limit => 100, :default => "", :null => false
			t.column "resource", :string, :limit => 30
			t.column "union_id", :integer
			t.column "subunion_id", :integer
    end
  end

  def self.down
    drop_table :visits
  end
end
