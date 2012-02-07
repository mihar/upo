class CreateInformation < ActiveRecord::Migration
  def self.up
    create_table :information do |t|
      t.column :title, :string
      t.column :address, :string
      t.column :post, :string
      t.column :post_id, :integer
      t.column :phone, :string
      t.column :fax, :string
      t.column :web, :string
      t.column :email, :string
      t.column :vatid, :string
      t.column :tax, :boolean
      t.column :office_hours, :string
    end
    
    Information.create({:title => 'Združenje društev upokojencev Slovenije'})
  end

  def self.down
    drop_table :information
  end
end
