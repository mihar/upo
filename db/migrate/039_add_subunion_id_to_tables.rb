class AddSubunionIdToTables < ActiveRecord::Migration
  def self.up
  	add_column :subsections, :subunion_id, :integer
  	add_column :news, :subunion_id, :integer
  	add_column :links, :subunion_id, :integer
  	add_column :albums, :subunion_id, :integer
  end

  def self.down
  	remove_column :subsections, :subunion_id
  	remove_column :news, :subunion_id
  	remove_column :links, :subunion_id
  	remove_column :albums, :subunion_id
  end
end
