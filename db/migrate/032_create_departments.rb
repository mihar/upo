class CreateDepartments < ActiveRecord::Migration
  def self.up
    create_table :departments do |t|
      t.column :title, :string
      t.column :union_id, :integer
    end
  end

  def self.down
    drop_table :departments
  end
end
