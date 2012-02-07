class AddHeaderToUnions < ActiveRecord::Migration
  def self.up
    add_column :unions, :header, :string
  end

  def self.down
    remove_column :unions, :header
  end
end
