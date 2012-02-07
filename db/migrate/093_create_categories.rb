class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :title
      t.integer :resource_categories_count, :default => 0
      t.boolean :standalone, :default => false
    end
    
    add_column :resource_categories, :category_id, :integer
    add_column :resources, :resource_category_id, :integer
  end

  def self.down
    remove_column :resources, :resource_category_id
    remove_column :resource_categories, :category_id
    drop_table :categories
  end
end
