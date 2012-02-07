class AddPositionToEverything < ActiveRecord::Migration
  def self.up
    Category.all(:order => 'position, title').each_with_index do |c, idx|
      c.position = idx+1
      c.save
      c.resource_categories.each_with_index do |rc, idx|
        rc.position = idx+1
        rc.save
      end
    end
    Page.all(:order => 'position, title').each_with_index do |p, idx|
      p.position = idx+1
      p.save
    end
    Link.all(:order => 'position, title').each_with_index do |l, idx|
      l.position = idx+1
      l.save
    end
  end

  def self.down
  end
end
