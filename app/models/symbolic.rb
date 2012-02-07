# == Schema Information
# Schema version: 102
#
# Table name: symbolics
#
#  id          :integer(11)     not null, primary key
#  title       :string(255)
#  image       :string(255)
#  description :text
#  union_id    :integer(11)
#  subunion_id :integer(11)
#

require 'union_db_helper'

class Symbolic < ActiveRecord::Base
	
	belongs_to :union
	belongs_to :subunion

  validates_presence_of :image
	
	file_column :image, :magick => {
    :versions => { "thumb" => "150x150", "medium" => "640x480>" }
	}
	
	# Get the by current union finder.
  extend UnionDBHelper
	
end
