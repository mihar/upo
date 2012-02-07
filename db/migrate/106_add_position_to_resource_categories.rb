class AddPositionToResourceCategories < ActiveRecord::Migration
  def self.up
    add_column :resource_categories, :position, :integer, :default => 0
  end

  def self.down
    remove_column :resource_categories, :position
  end
end
