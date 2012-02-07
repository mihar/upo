class CreateCounters < ActiveRecord::Migration
  def self.up
    create_table :counters do |t|
      t.integer :count, :default => 0
      t.integer :union_id
      t.integer :subunion_id
    end
    
    Counter.create({:union_id => 0, :subunion_id => 0})
    
    Union.find(:all).each do |u|
      Counter.create({:union_id => u.id})
    end

    Subunion.find(:all).each do |su|
      Counter.create({:subunion_id => su.id})
    end
    
end

  def self.down
    drop_table :counters
  end
end
