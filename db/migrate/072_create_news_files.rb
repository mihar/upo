class CreateNewsFiles < ActiveRecord::Migration
  def self.up
    create_table :news_files do |t|
      t.integer :union_id
      t.integer :subunion_id
      t.string :fileimage
      t.string :filedata
      t.integer :news_id
      t.integer :actuality_id
      t.integer :public_relation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :news_files
  end
end
