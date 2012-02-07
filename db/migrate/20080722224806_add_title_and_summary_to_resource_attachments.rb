class AddTitleAndSummaryToResourceAttachments < ActiveRecord::Migration
  def self.up
    add_column :resource_attachments, :summary, :text
  end

  def self.down
    remove_column :resource_attachments, :summary
  end
end
