class CreateSponsors < ActiveRecord::Migration
  def self.up
		create_table :sponsors do |t|
		  t.column :title, :string
		end
  end

  def self.down
  	drop_table :sponsors
  end
end
