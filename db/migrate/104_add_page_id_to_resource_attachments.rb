class AddPageIdToResourceAttachments < ActiveRecord::Migration
  def self.up
    add_column :resource_attachments, :page_id, :integer
  end

  def self.down
    remove_column :resource_attachments, :page_id
  end
end
