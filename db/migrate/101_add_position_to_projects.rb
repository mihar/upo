class AddPositionToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :position, :integer, :default => 0
  end

  def self.down
    remove_column :projects, :position
  end
end
