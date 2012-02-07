class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
    	t.column :name, :string
    	t.column :union_id, :integer
    	t.column :telephone, :string
    	t.column :fax, :string
    	t.column :email, :string
    	t.column :function, :string
    	t.column :extra, :string
    end
  end

  def self.down
    drop_table :people
  end
end
