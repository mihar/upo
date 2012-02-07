class CreateInformers < ActiveRecord::Migration
  def self.up
    create_table :informers do |t|
    	t.column :title, :string
    	t.column :url, :string
    end
  end

  def self.down
    drop_table :informers
  end
end
