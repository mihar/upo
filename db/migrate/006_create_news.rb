class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.column "title", :string
      t.column "created_at", :datetime
      t.column "text", :text
      t.column "union_id", :integer
    end
  end

  def self.down
    drop_table :news
  end
end
