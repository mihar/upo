class CreateRules < ActiveRecord::Migration
  def self.up
    create_table :rules do |t|
      t.column :rules, :text
    end
    
    Rules.create({:rules => 'Pravila!'})
  end

  def self.down
    drop_table :rules
  end
end
