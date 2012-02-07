class AddSummaryToResourceCategories < ActiveRecord::Migration
  def self.up
    add_column :resource_categories, :description, :text
  end

  def self.down
    remove_column :resource_categories, :description
  end
end
