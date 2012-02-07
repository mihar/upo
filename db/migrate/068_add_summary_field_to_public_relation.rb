class AddSummaryFieldToPublicRelation < ActiveRecord::Migration
  def self.up
    add_column :public_relations, :summary, :text
  end

  def self.down
    remove_column :public_relations, :summary
  end
end
