class AddUnionIdToLinks < ActiveRecord::Migration
  def self.up
    add_column "links", "union_id", :integer
  end

  def self.down
    remove_column "links", "union_id"
  end
end
