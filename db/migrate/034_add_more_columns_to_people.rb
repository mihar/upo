class AddMoreColumnsToPeople < ActiveRecord::Migration
  def self.up
		add_column :people, :address, :string
		add_column :people, :post_id, :integer
		add_column :people, :post, :string
		add_column :people, :mobile, :string
  end

  def self.down
  	remove_column :people, :address
  	remove_column :people, :post_id
  	remove_column :people, :post
  	remove_column :people, :mobile
  end
end
