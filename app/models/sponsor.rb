# == Schema Information
# Schema version: 102
#
# Table name: sponsors
#
#  id          :integer(11)     not null, primary key
#  title       :string(255)
#  union_id    :integer(11)
#  subunion_id :integer(11)
#

require 'union_db_helper'

class Sponsor < ActiveRecord::Base
  
  belongs_to :union
	belongs_to :subunion
  
  # Get the by current union finder.
  extend UnionDBHelper
end
