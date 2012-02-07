class AddMenuTitleToResourceCategories < ActiveRecord::Migration
  def self.up
    add_column :resource_categories, :menu_title, :string
    
    ResourceCategory.all.each do |rc|
      rc.menu_title = rc.title
      rc.save
    end
  end

  def self.down
    remove_column :resource_categories, :menu_title
  end
end
