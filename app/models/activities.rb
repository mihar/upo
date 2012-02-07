# == Schema Information
# Schema version: 102
#
# Table name: activities
#
#  id          :integer(11)     not null, primary key
#  activities  :text
#  union_id    :integer(11)
#  subunion_id :integer(11)
#

require 'union_db_helper'

class Activities < ActiveRecord::Base
  
  belongs_to :union
	belongs_to :subunion
	
	has_many :resource_attachments

  def activities_formatted
    RedCloth.new(self.activities).to_html unless self.activities.nil?
  end

  # Get the by current union finder.
  extend UnionDBHelper
end
