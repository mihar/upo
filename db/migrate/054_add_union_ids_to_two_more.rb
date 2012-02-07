class AddUnionIdsToTwoMore < ActiveRecord::Migration
  def self.up
    add_column :actualities, :union_id, :integer
    add_column :actualities, :subunion_id, :integer

    add_column :activities, :union_id, :integer
    add_column :activities, :subunion_id, :integer
  end

  def self.down
    remove_column :actualities, :union_id
    remove_column :actualities, :subunion_id

    remove_column :activities, :union_id
    remove_column :activities, :subunion_id
  end
end
