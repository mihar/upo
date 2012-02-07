# == Schema Information
# Schema version: 102
#
# Table name: counters
#
#  id          :integer(11)     not null, primary key
#  count       :integer(11)     default(0)
#  union_id    :integer(11)
#  subunion_id :integer(11)
#

require 'union_db_helper'

class Counter < ActiveRecord::Base
  
	belongs_to :union
	belongs_to :subunion
	
  # Get the by current union finder.
  extend UnionDBHelper
  
  # Counter incrementings
  def self.increment_for_union(union_id)
    c = find_by_union_id union_id
    c.count += 1
    c.save
  end
  def self.increment_for_subunion(subunion_id)
    c = find_for_subunion :first, subunion_id
    c.count += 1
    c.save
  end
  def self.increment_for_zdus
    c = find_for_zdus :first
    c.count += 1
    c.save
  end
  
end
