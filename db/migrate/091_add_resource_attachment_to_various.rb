class AddResourceAttachmentToVarious < ActiveRecord::Migration
  def self.up
    add_column :resource_attachments, :project_id, :integer
    add_column :resource_attachments, :department_id, :integer
    add_column :resource_attachments, :membership_id, :integer
    add_column :resource_attachments, :activities_id, :integer
    add_column :resource_attachments, :subsection_id, :integer
  end

  def self.down
    remove_column :resource_attachments, :subsection_id
    remove_column :resource_attachments, :activities_id
    remove_column :resource_attachments, :membership_id
    remove_column :resource_attachments, :department_id
    remove_column :resource_attachments, :project_id
  end
end
