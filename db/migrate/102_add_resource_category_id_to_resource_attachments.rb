class AddResourceCategoryIdToResourceAttachments < ActiveRecord::Migration
  def self.up
    add_column :resource_attachments, :resource_category_id, :integer
  end

  def self.down
    remove_column :resource_attachments, :resource_category_id
  end
end
