class AddFieldsToInformation < ActiveRecord::Migration
  def self.up
    add_column :information, :maticna_stevilka, :string
    add_column :information, :trr, :string
  end

  def self.down
    remove_column :information, :maticna_stevilka
    remove_column :information, :trr
  end
end
