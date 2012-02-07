class AddHaxorFlagToAdmins < ActiveRecord::Migration
  def self.up
    add_column "admins", "haxor", :integer
  end

  def self.down
    remove_column "admins", "haxor"
  end
end
