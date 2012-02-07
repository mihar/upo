class CreateForms < ActiveRecord::Migration
  def self.up
    create_table :forms do |t|
      t.column :title, :string
      t.column :file, :string
    end
  end

  def self.down
    drop_table :forms
  end
end
