class AddDescriptionToDepartments < ActiveRecord::Migration
  def self.up
    add_column :departments, :description, :text
  end

  def self.down
    remove_column :departments, :description
  end
end
