# == Schema Information
# Schema version: 102
#
# Table name: news_files
#
#  id          :integer(11)     not null, primary key
#  union_id    :integer(11)
#  subunion_id :integer(11)
#  fileimage   :string(255)
#  filedata    :string(255)
#  news_id     :integer(11)
#  created_at  :datetime
#  updated_at  :datetime
#

class NewsFile < ActiveRecord::Base
  
  belongs_to :news
  
  file_column :fileimage, :magick => {
    :versions => { "small" => "75x75", "thumb" => "200x200", "medium" => "640x480>" }
	}
	file_column :filedata
	
	def self.find_for(what, id)
	  find :all, :conditions => ["#{what}_id = ?", id]
	end
	
	def file
	  return self.fileimage unless self.fileimage.nil?
	  return self.filedata unless self.filedata.nil?
	end
	
	def image?
	  (not self.fileimage.nil?)
	end
  
end
