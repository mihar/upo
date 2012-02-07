class AddContactToUnion < ActiveRecord::Migration
  def self.up
    add_column "unions", "contact", :string, :limit => 128
  end

  def self.down
    remove_column "unions", "contact"
  end
end
