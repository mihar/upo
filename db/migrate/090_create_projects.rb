class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :title
      t.string :manager
      t.text :text
      t.text :summary

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
