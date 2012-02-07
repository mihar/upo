class RecreateSubsections < ActiveRecord::Migration
  def self.up
    drop_table :subsections
    create_table :subsections do |t|
      t.column "title", :string
      t.column "manager", :string
      t.column "working_hours", :string
      t.column "description", :text
      t.column "union_id", :integer
    end
  end

  def self.down
  end
end