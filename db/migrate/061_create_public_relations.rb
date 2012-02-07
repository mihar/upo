class CreatePublicRelations < ActiveRecord::Migration
  def self.up
    create_table :public_relations do |t|
      t.column :title, :string
      t.column :date, :date
      t.column :statement, :text
      t.column :author, :string
    end
  end

  def self.down
    drop_table :public_relations
  end
end
