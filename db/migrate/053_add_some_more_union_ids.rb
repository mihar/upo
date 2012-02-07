class AddSomeMoreUnionIds < ActiveRecord::Migration
  def self.up
    
    add_column :unions, :subunion_id, :integer

    add_column :sponsors, :union_id, :integer
    add_column :sponsors, :subunion_id, :integer
    
  end

  def self.down
    
    remove_column :unions, :subunion_id

    remove_column :sponsors, :union_id
    remove_column :sponsors, :subunion_id
    
  end
end
