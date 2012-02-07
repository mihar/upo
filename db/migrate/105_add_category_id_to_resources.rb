class AddCategoryIdToResources < ActiveRecord::Migration
  def self.up
    add_column :resources, :category_id, :integer
  end

  def self.down
    remove_column :resources, :category_id
  end
end
