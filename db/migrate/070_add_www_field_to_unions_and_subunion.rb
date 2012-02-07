class AddWwwFieldToUnionsAndSubunion < ActiveRecord::Migration
  def self.up
    add_column :unions, :www, :string
    add_column :subunions, :www, :string
  end

  def self.down
    remove_column :unions, :www
    remove_column :subunions, :www
  end
end
