class AddPzIdToAdmins < ActiveRecord::Migration
  def self.up
    add_column :admins, :subunion_id, :integer
  end

  def self.down
    remove_column :admins, :subunion_id
  end
end
