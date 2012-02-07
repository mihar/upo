class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.column :activities, :text
    end
    
    Activities.create({:activities => 'Aktivnosti!'})
  end

  def self.down
    drop_table :activities
  end
end
