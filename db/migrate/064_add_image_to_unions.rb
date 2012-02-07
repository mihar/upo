class AddImageToUnions < ActiveRecord::Migration
  def self.up
    add_column :unions, :image, :string
    add_column :subunions, :image, :string  
  end

  def self.down
    remove_column :unions, :image
    remove_column :subunions, :image
  end
end
