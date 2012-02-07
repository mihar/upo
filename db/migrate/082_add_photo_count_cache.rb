class AddPhotoCountCache < ActiveRecord::Migration
  def self.up
    add_column :albums, :photos_count, :integer, :default => 0

    Album.reset_column_information
    Album.find(:all).each do |p|
      Album.update_counters p.id, :photos_count => p.photos.length
    end
  end

  def self.down
    remove_column :albums, :photos_count
  end
end
