class AddImageFieldToPublicRelation < ActiveRecord::Migration
  def self.up
    add_column :public_relations, :image, :string
  end

  def self.down
    remove_column :public_relations, :image
  end
end
