class CreateActualities < ActiveRecord::Migration
  def self.up
    create_table :actualities do |t|
      t.column :title, :string
      t.column :date, :date
      t.column :text, :text
      t.column :image, :string
      t.column :show_zdus, :boolean
      t.column :show_pz, :boolean
      t.column :show_du, :boolean
      t.column :show_from, :date
      t.column :show_until, :date
    end
  end

  def self.down
    drop_table :actualities
  end
end
