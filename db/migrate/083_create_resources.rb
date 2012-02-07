class CreateResources < ActiveRecord::Migration
  def self.up
    
    create_table :resources, :force => true do |t|
      t.string :title
      t.text :text
      t.string :author
      t.integer :union_id
      t.integer :subunion_id
      t.integer :resource_attachments_count, :default => 0
      t.timestamps
    end

  end

  def self.down
    drop_table :resources
  end
end
