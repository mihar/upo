class AddContactEmailFields < ActiveRecord::Migration
  def self.up
    add_column :information, :email_contact, :string
    add_column :information, :email_contact_copy, :string
    add_column :unions, :email_contact, :string
    add_column :unions, :email_contact_copy, :string
    add_column :subunions, :email_contact, :string
    add_column :subunions, :email_contact_copy, :string
  end

  def self.down
    remove_column :subunions, :email_contact_copy
    remove_column :subunions, :email_contact
    remove_column :unions, :email_contact_copy
    remove_column :unions, :email_contact
    remove_column :information, :email_contact_copy
    remove_column :information, :email_contact

  end
end
