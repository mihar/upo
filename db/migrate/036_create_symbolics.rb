class CreateSymbolics < ActiveRecord::Migration
  def self.up
    create_table :symbolics do |t|
    	t.column :title, :string
    	t.column :image, :string
    	t.column :description, :text
    end
  end

  def self.down
    drop_table :symbolics
  end
end
