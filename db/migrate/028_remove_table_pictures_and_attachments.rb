class RemoveTablePicturesAndAttachments < ActiveRecord::Migration
  def self.up
  	drop_table :attachments
  	drop_table :pictures
  end

  def self.down
  	create_table :attachments, :force => true do |t|
      t.column :filename,        :string
      t.column :size,            :integer
      t.column :attachable_id,   :integer
      t.column :attachable_type, :string
      t.column :created_at,      :datetime
    end
  	create_table :pictures do |t|
      t.column "content_type", :string
      t.column "filename", :string     
      t.column "size", :integer
      
      # used with thumbnails, always required
      t.column "parent_id",  :integer 
      t.column "thumbnail", :string
      
      # required for images only
      t.column "width", :integer  
      t.column "height", :integer
      
      # albums, news... general parent linkage
      t.column :owner_id, :integer
      t.column :owner_type, :integer
    end
  end
end
