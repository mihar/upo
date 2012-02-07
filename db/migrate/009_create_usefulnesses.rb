class CreateUsefulnesses < ActiveRecord::Migration
  def self.up
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

  def self.down
    drop_table :usefulnesses
  end
end
