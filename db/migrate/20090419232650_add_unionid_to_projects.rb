class AddUnionidToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :union_id, :integer
  end

  def self.down
    remove_column :projects, :union_id
  end
end
