class CreateSubunions < ActiveRecord::Migration
  def self.up
    create_table :subunions do |t|
      t.column :title, :string
      t.column :address, :string
      t.column :postal_number, :integer
      t.column :telephone, :string
      t.column :president, :string
    end
  end

  def self.down
    drop_table :subunions
  end
end
