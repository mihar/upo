class ChangeAdminFields < ActiveRecord::Migration
  def self.up
    change_column :admins, :union_id, :integer
    change_column :admins, :haxor, :boolean
    change_column :admins, :zdus, :boolean
  end

  def self.down
  end
end
