class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.column "name", :string
      t.column "surname", :string
      t.column "username", :string
      t.column "password", :string
      t.column "union_id", :integer
    end
  end

  def self.down
    drop_table :admins
  end
end
