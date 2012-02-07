class AddLogoToUnions < ActiveRecord::Migration
  def self.up
    add_column :unions, :logo, :string
  end

  def self.down
    remove_column :unions, :logo
  end
end
