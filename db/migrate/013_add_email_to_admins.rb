class AddEmailToAdmins < ActiveRecord::Migration
  def self.up
    add_column "admins", "email", :string, :length => 64
  end

  def self.down
    remove_column "admins", "email"
  end
end
