class AddPositionToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :position, :integer, :default => 0
  end

  def self.down
    remove_column :links, :position
  end
end
