class AddCounterCacheToCategories < ActiveRecord::Migration
  def self.up
    add_column :resource_categories, :resources_count, :integer, :default => 0
  end

  def self.down
    remove_column :resource_categories, :resources_count
  end
end
