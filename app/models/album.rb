# == Schema Information
# Schema version: 102
#
# Table name: albums
#
#  id           :integer(11)     not null, primary key
#  title        :string(255)
#  date_taken   :date
#  union_id     :integer(11)
#  description  :text
#  subunion_id  :integer(11)
#  photos_count :integer(11)     default(0)
#

class Album < ActiveRecord::Base
	
	belongs_to :union
	has_many :photos, :dependent => :destroy
	
	validates_presence_of :title, :message => "ne sme biti prazno"
	
	# Method returns the first pic.
	def rep_image
	  photos.first
	end
	
	# Get the by current union finder.
  extend UnionDBHelper

end
