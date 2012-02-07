class CreateResourceAttachments < ActiveRecord::Migration
  def self.up
    create_table :resource_attachments do |t|
      t.string :title
      t.string :fileimage
      t.string :filedata
      t.string :link
      t.integer :resource_id
    end
  end

  def self.down
    drop_table :resource_attachments
  end
end
