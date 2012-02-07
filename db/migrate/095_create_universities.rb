class CreateUniversities < ActiveRecord::Migration
  def self.up
    create_table :universities do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :websafe_title

      t.timestamps
    end
  end

  def self.down
    drop_table :universities
  end
end
