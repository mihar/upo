class RemoveUsefulnesses < ActiveRecord::Migration
  def self.up
    drop_table :usefulnesses
    
  end

  def self.down
    create_table :usefulnesses do |t|
      t.column "title", :string
      t.column "address", :string
      t.column "locality", :string
      t.column "postal_code", :integer
      t.column "telephone", :string
      t.column "url", :string
      t.column "description", :text
    end
  end
end
