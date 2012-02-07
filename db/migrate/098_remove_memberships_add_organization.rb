class RemoveMembershipsAddOrganization < ActiveRecord::Migration
  def self.up
    add_column :resource_attachments, :organization_id, :integer
    remove_column :resource_attachments, :membership_id
  end

  def self.down
    add_column :resource_attachments, :membership_id, :integer
    remove_column :resource_attachments, :organization_id
  end
end
