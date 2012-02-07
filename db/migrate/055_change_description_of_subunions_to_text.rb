class ChangeDescriptionOfSubunionsToText < ActiveRecord::Migration
  def self.up
    remove_column :subunions, :description
    add_column :subunions, :description, :text
  end

  def self.down
    remove_column :subunions, :description
    add_column :subunions, :description, :text
  end
end
