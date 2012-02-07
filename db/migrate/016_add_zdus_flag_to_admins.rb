class AddZdusFlagToAdmins < ActiveRecord::Migration
  def self.up
    add_column "admins", "zdus", :integer, :limit => 1
  end

  def self.down
    remove_column "admins", "zdus"
  end
end
