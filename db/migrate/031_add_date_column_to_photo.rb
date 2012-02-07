class AddDateColumnToPhoto < ActiveRecord::Migration
  def self.up
  	add_column :photos, :date, :date
  end

  def self.down
  	remove_column :photos, :date
  end
end
