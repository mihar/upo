class AddEmailToSubunions < ActiveRecord::Migration
  def self.up
    add_column "subunions", "email", :string, :limit => 64
  end

  def self.down
    remove_column "subunions", "email"
  end
end
