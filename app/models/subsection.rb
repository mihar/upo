# == Schema Information
# Schema version: 102
#
# Table name: subsections
#
#  id            :integer(11)     not null, primary key
#  title         :string(255)
#  manager       :string(255)
#  working_hours :string(255)
#  description   :text
#  union_id      :integer(11)
#  subunion_id   :integer(11)
#

require 'union_db_helper'

class Subsection < ActiveRecord::Base 
  belongs_to :union
  belongs_to :subunion
  
  has_many :resource_attachments
  
  # Get the by current union finder.
  extend UnionDBHelper
end
