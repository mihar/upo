class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.text :organization
      t.integer :union_id
      t.integer :subunion_id
      
      t.timestamps
    end
    
    Organization.create({:organization => 'Organiziranost'})
  end

  def self.down
    drop_table :organizations
  end
end
