class CreateIzdelas < ActiveRecord::Migration
  def self.up
    create_table :izdelas do |t|
      t.string    :title
      t.datetime  :created_at
      t.text      :summary
      t.text      :text
      t.string    :image
      t.integer   :union_id
      t.integer   :subunion_id
    end
  end

  def self.down
    drop_table :izdelas
  end
end
