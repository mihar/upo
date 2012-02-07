class CreateUnions < ActiveRecord::Migration
  def self.up
    create_table :unions do |t|
      t.column "title", :string
      t.column "working_hours", :string
      t.column "address", :string
      t.column "locality", :string
      t.column "postal_number", :integer
      t.column "telephone", :string
      t.column "email", :string
      t.column "description", :text
    end
  end

  def self.down
    drop_table :unions
  end
end
