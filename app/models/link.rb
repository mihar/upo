# == Schema Information
# Schema version: 102
#
# Table name: links
#
#  id          :integer(11)     not null, primary key
#  title       :string(255)
#  description :string(255)
#  url         :string(255)
#  union_id    :integer(11)
#  subunion_id :integer(11)
#

class Link < ActiveRecord::Base
  
  include LinkHelpers
  
	belongs_to :union
  before_save :normalize_uri
	
	validates_presence_of :title, :description, :url
	
	acts_as_list
	
	# Get the by current union finder.
  extend UnionDBHelper
  
  protected
  
  def normalize_uri
    self.url = uri_normalize(self.url)    
  end
end
