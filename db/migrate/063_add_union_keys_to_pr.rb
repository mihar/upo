class AddUnionKeysToPr < ActiveRecord::Migration
  def self.up
    add_column :public_relations, :union_id, :integer, :default => 0
    add_column :public_relations, :subunion_id, :integer, :default => 0
  end

  def self.down
    remove_column :public_relations, :union_id
    remove_column :public_relations, :subunion_id
  end
end
