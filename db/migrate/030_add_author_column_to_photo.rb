class AddAuthorColumnToPhoto < ActiveRecord::Migration
  def self.up
		add_column :photos, :author, :string
  end

  def self.down
  	remove_column :photos, :author
  end
end
