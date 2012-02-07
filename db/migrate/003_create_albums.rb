class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.column "title", :string
      t.column "date_taken", :date
      t.column "union_id", :integer
    end
  end

  def self.down
    drop_table :albums
  end
end
