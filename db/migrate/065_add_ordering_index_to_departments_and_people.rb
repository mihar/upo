class AddOrderingIndexToDepartmentsAndPeople < ActiveRecord::Migration
  def self.up
    add_column :departments, :position, :integer
    add_column :people, :position, :integer
  end

  def self.down
    remove_column :departments, :position
    remove_column :people, :position
  end
end
