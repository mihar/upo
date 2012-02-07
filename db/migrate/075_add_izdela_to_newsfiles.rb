class AddIzdelaToNewsfiles < ActiveRecord::Migration
  def self.up
    add_column :news_files, :izdela_id, :integer
  end

  def self.down
    remove_column :news_files, :izdela_id
  end
end
