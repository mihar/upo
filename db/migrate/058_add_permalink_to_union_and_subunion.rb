class AddPermalinkToUnionAndSubunion < ActiveRecord::Migration
  def self.up
    add_column :unions, :permalink, :string
    add_column :subunions, :permalink, :string
  end

  def self.down
    remove_column :unions, :permalink
    remove_column :subunions, :permalink
  end
end
