class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.column "filename", :string
      t.column "album_id", :integer
    end
  end

  def self.down
    drop_table :photos
  end
end
