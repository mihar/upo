class CreatePostalNumbers < ActiveRecord::Migration
  def self.up
    create_table :postal_numbers do |t|
      t.column "postal_code", :integer
      t.column "city", :string
    end
  end

  def self.down
    drop_table :postal_numbers
  end
end
