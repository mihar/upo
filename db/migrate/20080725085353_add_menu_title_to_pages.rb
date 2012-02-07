class AddMenuTitleToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :menu_title, :string
    Page.all.each do |p|
      p.menu_title = p.title
      p.save
    end
  end

  def self.down
    remove_column :pages, :menu_title
  end
end
