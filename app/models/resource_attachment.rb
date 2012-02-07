# == Schema Information
# Schema version: 102
#
# Table name: resource_attachments
#
#  id                   :integer(11)     not null, primary key
#  title                :string(255)
#  fileimage            :string(255)
#  filedata             :string(255)
#  link                 :string(255)
#  resource_id          :integer(11)
#  google_video         :string(255)
#  project_id           :integer(11)
#  department_id        :integer(11)
#  activities_id        :integer(11)
#  subsection_id        :integer(11)
#  organization_id      :integer(11)
#  resource_category_id :integer(11)
#

class ResourceAttachment < ActiveRecord::Base

  include LinkHelpers
  
  before_save :normalize_uri
  
  belongs_to :resource_category
  belongs_to :resource, :counter_cache => true
  belongs_to :department
  belongs_to :activity
  belongs_to :subsection
  belongs_to :organization
  belongs_to :project
  
  file_column :fileimage, :magick => {
    :versions => { "small" => "75x75", "thumb" => "200x200>", "medium" => "640x480>" }
	}
	file_column :filedata
	
	def self.find_for(what, id)
	  find :all, :conditions => ["#{what}_id = ?", id]
	end
	
	def file
	  return self.fileimage unless self.fileimage.nil?
	  return self.filedata unless self.filedata.nil?
	end
	
	def link?
	  (not self.link.nil?)
	end
	
	def file?
	  (not self.filedata.nil?)
	end
	
	def image?
	  (not self.fileimage.nil?)
	end
  
  def video?
    (not self.google_video.nil?)
  end
  
  def title_or_filename
    if title
      return title
    elsif file?
      return File.basename(filedata)
    elsif image?
      return File.basename(fileimage)
    elsif link?
      return link
    end
  end
  
  protected
  
  def normalize_uri
    self.link = uri_normalize(self.link) unless self.link.blank?
    self.google_video = uri_normalize(self.google_video) unless self.google_video.blank?
  end
  
end
