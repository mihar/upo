class AddImageColumnToNews < ActiveRecord::Migration
  def self.up
		add_column :news, :image, :string
	end

  def self.down
  	remove_column :news, :image
  end
end
