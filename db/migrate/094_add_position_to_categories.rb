class AddPositionToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :position, :integer, :auto_increment => true
  end

  def self.down
    remove_column :categories, :position
  end
end
