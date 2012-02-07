# == Schema Information
# Schema version: 102
#
# Table name: departments
#
#  id          :integer(11)     not null, primary key
#  title       :string(255)
#  union_id    :integer(11)
#  subunion_id :integer(11)
#  position    :integer(11)
#  description :text
#

require 'union_db_helper'

class Department < ActiveRecord::Base
  
  belongs_to :union
	belongs_to :subunion
	
  has_many :people, :dependent => :destroy
  has_many :resource_attachments
  validates_presence_of :title
  
  # Get the by current union finder.
  extend UnionDBHelper
end
