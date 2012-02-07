class RenameDateColumnIntoCreatedAtInPublicRelations < ActiveRecord::Migration
  def self.up
    rename_column :public_relations, :date, :created_at
  end                             
                                  
  def self.down                   
    rename_column :public_relations, :created_at, :date
  end
end
