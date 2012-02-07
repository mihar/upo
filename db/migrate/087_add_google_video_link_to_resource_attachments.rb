class AddGoogleVideoLinkToResourceAttachments < ActiveRecord::Migration
  def self.up
    add_column :resource_attachments, :google_video, :string
  end
  

  def self.down
    remove_column :resource_attachments, :google_video
  end
end
