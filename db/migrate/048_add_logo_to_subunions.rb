class AddLogoToSubunions < ActiveRecord::Migration
  def self.up
    add_column :subunions, :logo, :string
  end

  def self.down
    remove_column :subunions, :logo
  end
end
