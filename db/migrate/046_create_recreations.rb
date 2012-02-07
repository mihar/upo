class CreateRecreations < ActiveRecord::Migration
  def self.up
    create_table :recreations do |t|
      t.column :title, :string
      t.column :leader, :string
      t.column :address, :string
      t.column :post_id, :integer
      t.column :post, :string
      t.column :phone, :string
      t.column :mobile, :string
      t.column :description, :text
    end
  end

  def self.down
    drop_table :recreations
  end
end
