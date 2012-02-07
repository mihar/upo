class AddSubunionIdToDepartments < ActiveRecord::Migration
  def self.up
    add_column :departments, :subunion_id, :integer
  end

  def self.down
    remove_column :departments, :subunion_id
  end
end
