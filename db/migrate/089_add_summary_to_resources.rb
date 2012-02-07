class AddSummaryToResources < ActiveRecord::Migration
  def self.up
    add_column :resources, :summary, :text
  end

  def self.down
    remove_column :resources, :summary
  end
end
